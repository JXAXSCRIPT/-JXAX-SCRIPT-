-- 🔥 JXAX BOOST 🔥
-- ULTRA MINI | Mobile | Numeric Speed | Auto Save | Right-Center Fixed

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local DEFAULT_SPEED = 16
local SAVE_FILE = "JXAX_BOOST_SPEED.txt"

-- ===== File Utils =====
local function canFile()
	return writefile and readfile and isfile
end

local function loadSpeed()
	if canFile() and isfile(SAVE_FILE) then
		local v = tonumber(readfile(SAVE_FILE))
		if v then return v end
	end
	return 50
end

local function saveSpeed(v)
	if canFile() then
		pcall(function()
			writefile(SAVE_FILE, tostring(v))
		end)
	end
end

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "JXAX_BOOST"
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 180, 0, 96) -- ULTRA MINI
main.Position = UDim2.new(1, -190, 0.5, -48) -- derecha / centro fijo
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(140,90,255)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,22)
title.BackgroundTransparency = 1
title.Text = "JXAX BOOST"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextColor3 = Color3.fromRGB(255,255,255)

-- Speed Box (números)
local box = Instance.new("TextBox", main)
box.Position = UDim2.new(0,10,0,26)
box.Size = UDim2.new(1,-20,0,26)
box.BackgroundColor3 = Color3.fromRGB(22,22,22)
box.TextColor3 = Color3.fromRGB(170,120,255)
box.PlaceholderText = "Speed"
box.Font = Enum.Font.GothamBold
box.TextSize = 15
box.ClearTextOnFocus = false
box.Text = tostring(loadSpeed())
Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

-- Toggle
local toggleBg = Instance.new("Frame", main)
toggleBg.Position = UDim2.new(0.5,-30,1,-30)
toggleBg.Size = UDim2.new(0,60,0,18)
toggleBg.BackgroundColor3 = Color3.fromRGB(30,30,30)
toggleBg.BorderSizePixel = 0
Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(1,0)

local knob = Instance.new("Frame", toggleBg)
knob.Size = UDim2.new(0,14,0,14)
knob.Position = UDim2.new(0,2,0.5,-7)
knob.BackgroundColor3 = Color3.fromRGB(170,120,255)
Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

-- ===== Logic =====
local enabled = false
local speed = tonumber(box.Text) or DEFAULT_SPEED

local function getHumanoid()
	local char = LP.Character
	if not char then return end
	return char:FindFirstChildOfClass("Humanoid")
end

local function applySpeed()
	local hum = getHumanoid()
	if hum then
		hum.WalkSpeed = speed
	end
end

box.FocusLost:Connect(function()
	local v = tonumber(box.Text)
	if v then
		speed = math.max(1, v)
		box.Text = tostring(speed)
		saveSpeed(speed)
	else
		box.Text = tostring(speed)
	end
end)

toggleBg.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
		enabled = not enabled
		if enabled then
			knob:TweenPosition(UDim2.new(1,-16,0.5,-7),"Out","Quad",0.1,true)
		else
			knob:TweenPosition(UDim2.new(0,2,0.5,-7),"Out","Quad",0.1,true)
			local hum = getHumanoid()
			if hum then hum.WalkSpeed = DEFAULT_SPEED end
		end
	end
end)

-- Mantiene el speed activo
RunService.RenderStepped:Connect(function()
	if enabled then
		applySpeed()
	end
end)

-- Reaplica al respawn
LP.CharacterAdded:Connect(function()
	task.wait(0.2)
	if enabled then applySpeed() end
end)
