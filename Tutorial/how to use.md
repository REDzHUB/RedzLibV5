## Destroy Instances

```lua
-- Destroy Tab :

local Tab = Window:MakeTab({Title = "Main", Icon = "Home"})

Tab:Destroy()

-- ////////// --

-- Destroy Options :

local Button = Tab:AddButton({"Button Example", function()
  -- Button Function
end})

local Toggle = Tab:AddButton({"Toggle Example", false, function()
  -- Toggle Function
end})

Button:Destroy() -- destroy the button
Toggle:Destroy() -- destroy the toggle
```

## Visible Instances

```lua
-- Visible Tab :

local Tab = Window:MakeTab({Title = "Main", Icon = "Home"})

Tab:Visible(false) -- Make the tab invisible < false >
Tab:Visible(true) -- make the tab visible < true >

-- ////////// --

-- Visible Options :

local Button = Tab:AddButton({"Button Example", function()
  -- Button Function
end})

local Toggle = Tab:AddButton({"Toggle Example", false, function(Value)
  -- Toggle Function
end})

Button:Visible(false) -- Make the button invisible < false >
Toggle:Visible(true) -- Make the toggle visible < true >
```

## Set Section
set section values

```lua
local Section = Tab:AddSection("Section")

-- New Text

Section:Set("New Section Text") -- string
```

## Set Paragraph
set paragraph values

```lua
local Paragraph = Tab:AddParagraph({"Paragraph", "This is a Paragraph"})

-- Set Title + Text
Paragraph:Set("New Title", "New Text") -- string, string

-- Set Only Text
Paragraph:Set("New Text") -- string

Paragraph:SetTitle("New Title") -- string
Paragraph:SetDesc("New Text") -- string

-- set using function
Paragraph:Set(function()
  if 1 + 1 == 2 then
    return "New Text 1"
  elseif game.PlaceId == game.PlaceId then
    return "New Text 2"
  end
  return "New Text 3"
end)
```

## Set Button
set button values

```lua
local Button = Tab:AddButton({"Button", function(Value)
  
end})

-- New Function/Callback

Toggle:Set(function()
  print("Click!")
end) -- function

```

## Set Toggle
Set toggle values

```lua
local Toggle = Tab:AddToggle({"Toggle", false, function(Value)
  
end})

-- New Value

Toggle:Set(false) -- boolean

-- New Function/Callback

Toggle:Set(function(Value)
  print(Value)
end) -- function
```
