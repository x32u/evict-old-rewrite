from discord.ext import commands
from ...helpers import EvictContext
from evictAPI.errors import HTTPError
from evictAPI.models import InstagramUser


class InstagramUser(commands.Converter):
    async def convert(self, ctx: EvictContext, argument: str) -> InstagramUser:
        try:
            return await ctx.bot.api.get_instagram_user(argument)
        except HTTPError as err:
            return await ctx.error(err.args[0])
