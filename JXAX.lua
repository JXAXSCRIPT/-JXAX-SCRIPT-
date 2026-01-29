-- 🔥 JXAX SCRIPT 🔥
-- Mobile Friendly | Small Top Menu | RGB Border | Kick Button

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "JXAX_SCRIPT"
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0.5, -100, 0, 10) -- arriba
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Corner
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

-- RGB Border
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundTransparency = 1
title.Text = "🔥 JXAX SCRIPT 🔥"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 12

-- Kick Button
local kickBtn = Instance.new("TextButton", frame)
kickBtn.Size = UDim2.new(0.9, 0, 0, 30)
kickBtn.Position = UDim2.new(0.05, 0, 0.45, 0)
kickBtn.Text = "KICK"
kickBtn.Font = Enum.Font.GothamBold
kickBtn.TextSize = 14
kickBtn.TextColor3 = Color3.new(1,1,1)
kickBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)

local kickCorner = Instance.new("UICorner", kickBtn)
kickCorner.CornerRadius = UDim.new(0, 8)

-- Kick Function
kickBtn.MouseButton1Click:Connect(function()
	LocalPlayer:Kick("🔥 JXAX SCRIPT 🔥\nHas sido expulsado")
end)

-- RGB Animation
local hue = 0
RunService.RenderStepped:Connect(function()
	hue = (hue + 1) % 360
	stroke.Color = Color3.fromHSV(hue/360, 1, 1)
end)
