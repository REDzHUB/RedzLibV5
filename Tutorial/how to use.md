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

Button:Destroy()
Toggle:Destroy()
```

## Visible Instances

```lua
-- Visible Tab :

local Tab = Window:MakeTab({Title = "Main", Icon = "Home"})

Tab:Visible(false)
Tab:Visible(true)

-- ////////// --

-- Visible Options :

local Button = Tab:AddButton({"Button Example", function()
  -- Button Function
end})

local Toggle = Tab:AddButton({"Toggle Example", false, function()
  -- Toggle Function
end})

Button:Visible(false)
Toggle:Visible(true)
```
