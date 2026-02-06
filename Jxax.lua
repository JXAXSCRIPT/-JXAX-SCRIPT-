-- 🔥 JXAX | KICK ESQUINA SUPERIOR DERECHA (MOBILE) 🔥

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "JXAX"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Botón KICK
local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0, 70, 0, 30) -- tamaño pequeño
button.Position = UDim2.new(1, -80, 0, 10) -- esquina superior derecha
button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
button.Text = "KICK"
button.TextSize = 12
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.AutoButtonColor = false

-- Bordes redondeados
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = button

-- Borde RGB
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Parent = button

-- Animación RGB
local hue = 0
RunService.RenderStepped:Connect(function()
	hue = (hue + 1) % 360
	stroke.Color = Color3.fromHSV(hue / 360, 1, 1)
end)

-- Acción Kick
button.MouseButton1Click:Connect(function()
	player:Kick("🔥 JXAX KICK ACTIVADO 🔥")
end)
