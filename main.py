from tools.bot import Evict
from tools.helpers import EvictContext

bot = Evict()


@bot.before_invoke
async def chunk_guild(ctx: EvictContext) -> None:
    if not ctx.guild.chunked:
        await ctx.guild.chunk(cache=True)


@bot.check
async def check_availability(ctx: EvictContext) -> bool:
    return True


@bot.check
async def disabled_command(ctx: EvictContext):
    
    if await ctx.bot.db.fetchrow(
        
        """
        SELECT * FROM disablecmd
        WHERE guild_id = $1
        AND cmd = $2
        """,
        
        ctx.guild.id,
        str(ctx.command),
    ):
        
        if not ctx.author.guild_permissions.administrator:
            
            await ctx.error(
                f"The command **{str(ctx.command)}** is **disabled** in this server"
            )
            
            return False
        return True

    global_disabled = await ctx.bot.db.fetchrow(
        """
        SELECT disabled FROM global_disabled_cmds
        WHERE cmd = $1
        """,
        
        ctx.bot.get_command(str(ctx.command)).name,
    )
    
    if global_disabled:
        if global_disabled.get("disabled") and ctx.author.id not in ctx.bot.owner_ids:
            
            await ctx.warning(
                "This command is currently disabled by the admin team of evict, for further information please join the [evict Server](https://discord.gg/evict)."
            )
            
            return False
    return True


@bot.check
async def disabled_module(ctx: EvictContext):
    
    if ctx.command.cog:
        if await ctx.bot.db.fetchrow(
            
            """
            SELECT FROM disablemodule
            WHERE guild_id = $1
            AND module = $2
            """,
            
            ctx.guild.id,
            ctx.command.cog_name,
        ):
            
            if not ctx.author.guild_permissions.administrator:
                
                await ctx.warning(
                    f"The module **{str(ctx.command.cog_name.lower())}** is **disabled** in this server"
                )
                
                return False
            
            else:
                return True
        else:
            return True
    else:
        return True


@bot.check
async def restricted_command(ctx: EvictContext):
    
    if ctx.author.id == ctx.guild.owner_id:
        return True

    if check := await ctx.bot.db.fetch(
        
        """
        SELECT * FROM restrictcommand
        WHERE guild_id = $1
        AND command = $2
        """,
        
        ctx.guild.id,
        ctx.command.qualified_name,
    ):
        
        for row in check:
            role = ctx.guild.get_role(row["role_id"])
            
            if not role:
                await ctx.bot.db.execute(
                    
                    """
                    DELETE FROM restrictcommand
                    WHERE role_id = $1
                    """,
                    
                    row["role_id"],
                )

            if not role in ctx.author.roles:
                await ctx.warning(f"You cannot use `{ctx.command.qualified_name}`")
                
                return False
            return True
    
    return True

if __name__ == "__main__":
    bot.run()
