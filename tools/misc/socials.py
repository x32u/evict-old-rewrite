import aiohttp
import datetime
import dateutil
import os

from discord.ext import commands

from typing import Any, Optional, List
from pydantic import BaseModel
from tools.helpers import EvictContext

from kureAPI.errors import HTTPError
from kureAPI.models import InstagramUser


class CashApp(BaseModel):
    """
    Model for cashapp user
    """

    url: str
    qr: Any


class CashappUser(commands.Converter):
    async def convert(self, ctx: EvictContext, argument: str) -> CashApp:
        async with aiohttp.ClientSession() as cs:
            async with cs.get(f"https://cash.app/${argument}") as r:
                if r.status == 404:
                    raise commands.BadArgument("Cashapp profile not found")
                if r.status == 200:
                    data = {
                        "url": str(r.url),
                        "qr": await ctx.bot.getbyte(
                            f"https://cash.app/qr/${argument}?size=288&margin=0"
                        ),
                    }
                    return CashApp(**data)
                else:
                    raise commands.BadArgument(
                        "There was a problem getting the user's cashapp profile"
                    )
                
class Roblox(BaseModel):
    """
    Model for roblox player
    """

    username: str
    id: str
    url: str
    display_name: str
    avatar_url: str
    banned: bool
    bio: Optional[str]
    created_at: Any
    friends: int
    followings: int
    followers: int
    icon: str = (
        "https://play-lh.googleusercontent.com/WNWZaxi9RdJKe2GQM3vqXIAkk69mnIl4Cc8EyZcir2SKlVOxeUv9tZGfNTmNaLC717Ht=w240-h480-rw"
    )

class RobloxUser(commands.Converter):
    async def convert(self, ctx: commands.Context, argument: str) -> Roblox:
        async with aiohttp.ClientSession(
            headers={"api-key": ctx.bot.evict_api}
        ) as session:
            async with session.get(
                "https://kure.pl/roblox", params={"username": argument}
            ) as r:
                match r.status:
                    case 404:
                        raise commands.BadArgument("Roblox account not found")
                    case 200:
                        data = await r.json()
                        data["bio"] = data["bio"].replace("\\n", "\n")
                        data["created_at"] = datetime.datetime.fromtimestamp(
                            data["created_at"]
                        )
                        return Roblox(**data)
                    case _:
                        raise commands.BadArgument(
                            "There was a problem getting details about this roblox user"
                        )


class Snapchat(BaseModel):
    """
    Model for snapchat profile
    """

    username: str
    display_name: str
    snapcode: str
    bio: Optional[str]
    avatar: str
    url: str


class SnapUser(commands.Converter):
    async def convert(self, ctx: EvictContext, argument: str) -> Snapchat:
        async with aiohttp.ClientSession(headers={"api-key": ctx.bot.evict_api}) as cs:
            async with cs.get(
                "https://kure.pl/snapchat", params={"username": argument}
            ) as r:
                if r.status != 200:
                    raise commands.BadArgument(
                        f"Couldn't get information about **{argument}** (`{r.status}`)"
                    )

                return Snapchat(**(await r.json()))


class TikTok(BaseModel):
    """
    Model for tiktok user
    """

    username: str
    nickname: Optional[str]
    avatar: str
    bio: str
    badges: List[str]
    url: str
    followers: int
    following: int
    hearts: int


class TikTokUser(commands.Converter):
    async def convert(self, ctx: EvictContext, argument: str) -> TikTok:
        async with ctx.typing():
            async with aiohttp.ClientSession(
                headers={"api-key": ctx.bot.evict_api}
            ) as cs:
                async with cs.get(
                    "https://kure.pl/tiktok", params={"username": argument}
                ) as r:
                    if r.status != 200:
                        raise commands.BadArgument("Couldn't get this tiktok page")

                    data = await r.json()
                    badges = []

                    if data.get("private"):
                        badges.append("🔒")

                    if data.get("verified"):
                        badges.append("<:verified:1233237074128277637>")

                    data["badges"] = badges
                    return TikTok(**data)           


class Github(BaseModel):
    """
    Model for github user
    """

    username: str
    avatar_url: str
    url: str
    display: Optional[str]
    company: Optional[str]
    bio: Optional[str]
    repos: int
    followers: int
    following: int
    created_at: Any


class GithubUser(commands.Converter):
    async def convert(self, ctx: EvictContext, argument: str) -> Github:

        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36",
            "Content-Type": "application/json",
        }

        async with aiohttp.ClientSession(headers=headers) as cs:
            async with cs.get(f"https://api.github.com/users/{argument}") as r:
                if r.status != 200:
                    raise commands.BadArgument(
                        "Something went wrong while trying to get this github user"
                    )

                res = await r.json()

                if not res.get("login"):
                    raise commands.BadArgument(
                        f"Github user **{argument}** doesn't exist"
                    )

                res["created_at"] = dateutil.parser.parse(res["created_at"])
                res["repos"] = res["public_repos"]
                res["display"] = res["name"]
                res["username"] = res["login"]
                res["url"] = res["html_url"]
                return Github(**res)


class InstagramUser(commands.Converter):
    async def convert(self, ctx: EvictContext, argument: str) -> InstagramUser:
        try:
            return await ctx.bot.api.get_instagram_user(argument)
        except HTTPError as err:
            return await ctx.error(err.args[0])
        
        
class Weather(BaseModel):
    """
    Model for weather api results
    """

    place: str
    country: str
    temp_c: float
    temp_f: float
    wind_mph: float
    wind_kph: float
    humidity: float
    condition: str
    condition_image: str
    condition: str
    time: Any


class WeatherLocation(commands.Converter):
    async def convert(self, ctx: EvictContext, argument: str) -> Weather:
        url = "http://api.weatherapi.com/v1/current.json"
        params = {"key": os.environ.get("weather"), "q": argument}

        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36",
            "Content-Type": "application/json",
        }

        async with aiohttp.ClientSession(headers=headers) as cs:
            async with cs.get(url, params=params) as r:
                if r.status == 400:
                    raise commands.BadArgument("The location provided is not valid")

                data = await r.json()

                payload = {
                    "place": data["location"]["name"],
                    "country": data["location"]["country"],
                    "temp_c": data["current"]["temp_c"],
                    "temp_f": data["current"]["temp_f"],
                    "wind_mph": data["current"]["wind_mph"],
                    "wind_kph": data["current"]["wind_kph"],
                    "humidity": data["current"]["humidity"],
                    "condition": data["current"]["condition"]["text"],
                    "condition_image": f"http:{data['current']['condition']['icon']}",
                    "time": datetime.datetime.fromtimestamp(
                        int(data["current"]["last_updated_epoch"])
                    ),
                }

                return Weather(**payload)