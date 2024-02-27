repeat task.wait() until game:IsLoaded()

local Languages = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Translator/languages"))()
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local function Encode(Source)return HttpService:JSONEncode(Source)end
local function Decode(Source)return HttpService:JSONDecode(Source)end

local request = request or http_request or HttpPost or syn.request

local reqid = 1000
local executeURL = "https://Translate.google.com/_/TranslateWebserverUi/data/batchexecute"
local rootURL = "https://Translate.google.com/"
local CurrentLang = "en"

local function got(Url, Method, Body)
  Method = Method or "GET"
  
  local res = request({
    ["Url"] = Url,
    ["Method"] = Method,
    ["Headers"] = {
      ["cookie"] = "CONSENT=YES+"
    },
    ["Body"] = Body
  })
  
  if res.Body:match("https://consent.google.com/s") then
    res = syn.request({
      ["Url"] = Url,
      ["Method"] = "GET",
      ["Headers"] = {
        ["cookie"] = "CONSENT=YES+"
      }
    })
  end
  
  return res
end

local function find(Lang)
  Lang = Lang:lower()
  for Ind,Val in pairs(Languages) do
    if Ind == Lang or Val == Lang then
      return Ind
    end
  end
end

local function getISOCode(Lang)
  return find(Lang)
end

local function stringifyQuery(Fields)
  local data = ""
  for Ind,Val1 in pairs(Fields) do
    if type(Val1) == "table" then
      for _,Val2 in pairs(Val1) do
        data = data .. ("&%s=%s"):format(HttpService:UrlEncode(Ind), HttpService:UrlEncode(Val2))
      end
    else
      data = data .. ("&%s=%s"):format(HttpService:UrlEncode(Ind), HttpService:UrlEncode(Val1))
    end
  end
  data = data:sub(2)
  return data
end

local function Translate(str, to, from)
  from = from and getISOCode(from) or "auto"
  to = to and getISOCode(to) or "en"
  
  local data = {{str, from, to, true}, {nil}}
  
  local freq = {{{"MkEWBc", Encode(data), nil, "generic"}}}
  
  local url = executeURL.."?"..stringifyQuery{rpcids = "MkEWBc", ["f.sid"] = "", bl = "", hl="en", _reqid = 0, rt = "c"}
  local body = stringifyQuery{["f.req"] = Encode(freq)}
  local req = got(url, "POST", body)
  
  local body = Decode(req.Body:match"%[.-%]\n")
  local translationData = Decode(body[1][3])
  local result = {
    text = "",
    from = {
      language = "",
      text = ""
    },
    raw = ""
  }
  
  result.raw = translationData
  result.text = translationData[2][1][1][6][1][1]
  
  result.from.language = translationData[3]
  result.from.text = translationData[2][5][1]
  
  return result
end

local function TranslateFrom(Message)
  local result = Translate(Message, CurrentLang)
  
  local text
  if result.from.language ~= CurrentLang then 
    text = result.text
  end
  
  return ({
    ["text"] = text,
    ["lang"] = result.from.language
  })
end

local function TranslateTo(Message, Target)
  return Translate(Message, Target:lower(), "auto").text
end

local function SetLang(NewLang)
  CurrentLang = NewLang
end

return ({
  SetLang = SetLang,
  Translate = Translate,
  TranslateTo = TranslateTo,
  TranslateFrom = TranslateFrom
})
