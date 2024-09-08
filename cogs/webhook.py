import random
import string
import discord
import aiohttp


from discord.ext.commands import (
    group,
    Cog,
    has_guild_permissions,
    bot_has_guild_permissions,
)

from tools.bot import Evict
from tools.helpers import EvictContext
from tools.validators import ValidWebhookCode
from tools.handlers.embedbuilder import EmbedScript


class Webhooks(Cog):
    def __init__(self, bot: Evict):
        self.bot = bot
        self.description = "Webhook building commands"
        self.headers = {"Content-Type": "application/json"}

    @group(invoke_without_command=True, name="webhook")
    async def webhook_editor(self, ctx):
        await ctx.create_pages()

    @webhook_editor.command(name="create", brief="manage webhooks")
    @has_guild_permissions(manage_webhooks=True)
    @bot_has_guild_permissions(manage_webhooks=True)
    async def webhook_create(
        self, ctx: EvictContext, channel: discord.TextChannel, *, name: str = None
    ):
        """
        Create a webhook in a channel
        """

        webhook = await channel.create_webhook(
            name="evict - webhook", reason=f"Webhook created by {ctx.author}"
        )
        source = string.ascii_letters + string.digits
        code = "".join((random.choice(source) for _ in range(8)))
        await self.bot.db.execute(
            """
      INSERT INTO webhook 
      VALUES ($1,$2,$3,$4,$5,$6)
      """,
            ctx.guild.id,
            code,
            webhook.url,
            channel.mention,
            name or self.bot.user.name,
            self.bot.user.display_avatar.url,
        )
        return await ctx.success(
            f"Created webhook named **{name or self.bot.user.name}** in {channel.mention} with the code `{code}`. Please save it in order to send webhooks with it"
        )

    @webhook_editor.group(
        invoke_without_command=True, name="edit", brief="manage webhooks"
    )
    async def webhook_edit(self, ctx: EvictContext):
        """
        Edit the webhook's look
        """

        await ctx.create_pages()

    @webhook_edit.command(name="name", brief="manage webhooks")
    @has_guild_permissions(manage_webhooks=True)
    async def webhook_edit_name(
        self, ctx: EvictContext, code: ValidWebhookCode, *, name: str
    ):
        """
        Edit a webhook's name
        """

        await self.bot.db.execute(
            """
      UPDATE webhook 
      SET name = $1 
      WHERE guild_id = $2 
      AND code = $3
      """,
            name,
            ctx.guild.id,
            code,
        )
        return await ctx.success(f"Webhook name changed to **{name}**")

    @webhook_edit.command(name="avatar", aliases=["icon"], brief="manage webhooks")
    @has_guild_permissions(manage_webhooks=True)
    async def webhook_edit_avatar(
        self, ctx: EvictContext, code: ValidWebhookCode, url: str = None
    ):
        """
        Edit the webhook's avatar
        """

        if not url:
            if not ctx.message.attachments:
                return await ctx.error("Avatar not found")

            if not ctx.message.attachments[0].filename.endswith(
                (".png", ".jpeg", ".jpg")
            ):
                return await ctx.error("Attachment must be a png or jpeg")

            url = ctx.message.attachments[0].proxy_url

        await self.bot.db.execute(
            """
      UPDATE webhook 
      SET avatar = $1 
      WHERE guild_id = $2 
      AND code = $3
      """,
            url,
            ctx.guild.id,
            code,
        )
        return await ctx.success("Changed webhook's avatar")

    @webhook_editor.command(name="send", brief="manage webhooks")
    @has_guild_permissions(manage_webhooks=True)
    async def webhook_send(
        self, ctx: EvictContext, code: ValidWebhookCode, *, script: EmbedScript = None
    ):
        """
        Send a webhook using a discohook json file / embed code
        """
        check = await self.bot.db.fetchrow(
            "SELECT * FROM webhook WHERE guild_id = $1 AND code = $2",
            ctx.guild.id,
            code,
        )
        if script is None:
            if ctx.message.attachments:
                script = await self.embed_json(ctx.author, ctx.message.attachments[0])
            else:
                return await ctx.send_help(ctx.command)

        script.update(
            {"wait": True, "username": check["name"], "avatar_url": check["avatar"]}
        )

        async with aiohttp.ClientSession(headers=self.headers) as session:
            webhook = discord.Webhook.from_url(url=check["url"], session=session)

            if not webhook:
                return await ctx.error("No webhook found with this code")

            w = await self.bot.fetch_webhook(webhook.id)
            mes = await w.send(**script)
            await ctx.success(f"Sent webhook -> {mes.jump_url}")

    @webhook_editor.command(name="list")
    async def webhook_list(self, ctx: EvictContext):
        """
        Weturns a list of available server webhooks
        """

        results = await self.bot.db.fetch(
            "SELECT * FROM webhook WHERE guild_id = $1", ctx.guild.id
        )

        if len(results) == 0:
            return await ctx.error("There are no webhooks in this server")

        await ctx.paginate(
            [f"`{result['code']}` - {result['channel']}" for result in results],
            f"Webhooks ({len(results)})",
            {"name": ctx.guild.name, "icon_url": ctx.guild.icon},
        )

    @webhook_editor.command(name="delete", brief="manage webhooks")
    @has_guild_permissions(manage_webhooks=True)
    @bot_has_guild_permissions(manage_webhooks=True)
    async def webhook_delete(self, ctx: EvictContext, code: ValidWebhookCode):
        """
        Delete a webhook created by the bot
        """

        check = await self.bot.db.fetchrow(
            "SELECT * FROM webhook WHERE guild_id = $1 AND code = $2",
            ctx.guild.id,
            code,
        )
        async with aiohttp.ClientSession(headers=self.headers) as session:
            webhook = discord.Webhook.from_url(check["url"], session=session)
            await self.bot.db.execute(
                "DELETE FROM webhook WHERE guild_id = $1 AND code = $2",
                ctx.guild.id,
                code,
            )
            await webhook.delete(reason=f"Webhook deleted by {ctx.author}")

        return await ctx.success("Deleted webhook")


async def setup(bot: Evict) -> None:
    return await bot.add_cog(Webhooks(bot))
