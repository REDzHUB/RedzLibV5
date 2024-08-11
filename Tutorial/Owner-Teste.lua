local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({"redz Hub : Blox Fruits", "by redz9999", "testando-redzLibv5.json"})
Window:AddMinimizeButton({
  Button = { Image = redzlib:GetIcon("Apple"), BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

local Tab1 = Window:MakeTab({"Um", ""})
local Tab2 = Window:MakeTab({"Dois", "Sword"})
local Tab3 = Window:MakeTab({"Três", "User"})

Tab1:AddButton({"Dark Theme", function()
  redzlib:SetTheme("Dark")
end})

Tab1:AddButton({"Darker Theme", function()
  redzlib:SetTheme("Darker")
end})

Tab1:AddButton({"Dark Purple", function()
  redzlib:SetTheme("Purple")
end})

-- Window:SelectTab(Tab2)
local Section = Tab2:AddSection({"Section"})
local Paragraph = Tab2:AddParagraph({"Paragraph", "This is a Paragraph\nSecond Line"})

local Number = 0
local Button = Tab2:AddButton({"Button", function()
  Number = Number + 1
  Section:Set("Number : " .. tostring(Number))
  local Dialog = Window:Dialog({
    Title = "Dialog",
    Text = "This is a Dialog",
    Options = {
      {"Ok!", function()
        
      end}
    }
  })
end})

local Button = Tab2:AddButton({
  Name = "Invisible Toggle",
  Description = "Makes the Toggles Invisible"
})

local Toggle1 = Tab2:AddToggle({
  Name = "Toggle 1",
  Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
  Flag = "Toggle1",
  Default = false
})

local Toggle2 = Tab2:AddToggle({
  Name = "Toggle 2",
  Default = true,
  Flag = "Toggle2"
})

Button:Callback(Toggle1.Visible)
Button:Callback(Toggle2.Visible)

Toggle1:Callback(function(Value)
  Toggle2:Set(false)
end)
Toggle2:Callback(function(Value)
  Toggle1:Set(false)
end)

-- local Button = Tab2:AddButton({"Refresh Dropdown"})

local Dropdown = Tab2:AddDropdown({
  Name = "Players List",
  Description = "Select a random Number",
  Options = {"One", "Two", "Three", "Four", "Five"},
  Default = {"Two", "Four"},
  Flag = "Dropdown Teste 2",
  MultiSelect = true
})

-- Dropdown:Set("All", false)
-- Dropdown:Set("All", true)

Dropdown:Callback(function(Value)
  -- table.foreach(Value, print)
  -- print(Value, typeof(Value))
end)

local Slider = Tab2:AddSlider({
  Name = "This is a Slider",
  -- Flag = "Slider Teste"
  Default = 40
})

Slider:Callback(function(Value)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

--[[Button:Callback(function()
  Dropdown:Set(Players:GetPlayers())
  Dropdown:Remove(Player.Name)
end

Dropdown:Remove(Player.Name)
Dropdown:Select(1)]]

local TextBox = Tab2:AddTextBox({
  Name = "Textbox",
  Description = "Walk Speed",
  PlaceholderText = "Number: 25/100",
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end
})

TextBox.OnChanging = function(Text)
  local Number = tonumber(Text)
  if Number then
    return math.clamp(Number, 25, 100)
  end
  return 25
end

Tab3:AddDiscordInvite({
  Name = "redz Hub | Community",
  Description = "Join our discord community to receive information about the next update",
  Logo = "rbxassetid://15298567397",
  Invite = "https://discord.gg/7aR7kNVt4g"
})
