-- 🔥 JXAX SCRIPT 🔥
-- Speed Ajustable hasta 300 | Mobile Friendly

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- GUI principal
local gui = Instance.new("ScreenGui")
gui.Name = "JXAX_SCRIPT"
gui.Parent = game.CoreGui

-- Icono flotante
local icon = Instance.new("TextButton")
icon.Parent = gui
icon.Size = UDim2.new(0, 65, 0, 65)
icon.Position = UDim2.new(0, 15, 0.5, -32)
icon.Text = "🔥JXAX🔥"
icon.Font = Enum.Font.GothamBold
icon.TextScaled = true
icon.TextColor3 = Color3.new(1,1,1)
icon.BackgroundColor3 = Color3.fromRGB(20,20,20)
icon.Active = true
icon.Draggable = true
icon.BorderSizePixel = 0

local iconCorner = Instance.new("UICorner", icon)
iconCorner.CornerRadius = UDim.new(1,0)

-- Frame menú
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 210, 0, 130)
frame.Position = UDim2.new(0.5, -105, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 10)

-- Borde RGB
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2

task.spawn(function()
	while true do
		for h = 0,1,0.01 do
			stroke.Color = Color3.fromHSV(h,1,1)
			task.wait(0.02)
		end
	end
end)

-- Título
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,28)
title.BackgroundTransparency = 1
title.Text = "🔥 JXAX SCRIPT 🔥"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)

-- Texto speed
local speedText = Instance.new("TextLabel", frame)
speedText.Position = UDim2.new(0,10,0,40)
speedText.Size = UDim2.new(1,-20,0,20)
speedText.BackgroundTransparency = 1
speedText.Text = "Speed (0 - 300)"
speedText.Font = Enum.Font.Gotham
speedText.TextScaled = true
speedText.TextColor3 = Color3.new(1,1,1)
speedText.TextXAlignment = Enum.TextXAlignment.Left

-- Caja de speed
local speedBox = Instance.new("TextBox", frame)
speedBox.Position = UDim2.new(0,10,0,65)
speedBox.Size = UDim2.new(1,-20,0,35)
speedBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
speedBox.Text = "16"
speedBox.Font = Enum.Font.GothamBold
speedBox.TextScaled = true
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.ClearTextOnFocus = false

local boxCorner = Instance.new("UICorner", speedBox)
boxCorner.CornerRadius = UDim.new(0,8)

-- Función speed
local function applySpeed(val)
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid.WalkSpeed = val
	end
end

-- Al escribir
speedBox.FocusLost:Connect(function()
	local num = tonumber(speedBox.Text)
	if num and num >= 0 and num <= 300 then
		applySpeed(num)
	else
		speedBox.Text = "16"
		applySpeed(16)
	end
end)

-- Mantener speed activo
RunService.RenderStepped:Connect(function()
	local num = tonumber(speedBox.Text)
	if num and num <= 300 then
		applySpeed(num)
	end
end)

-- Ocultar / mostrar menú
icon.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)
