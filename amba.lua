--[[
      AMBA.HUB by pinguin
      Description: Aimbot & ESP with Toggle GUI.
--]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- ==========================================
-- 1. SETTING DEFAULT
-- ==========================================
_G.AimbotEnabled = true
_G.ESPEnabled = true
_G.CircleRadius = 150
_G.CircleColor = Color3.fromRGB(255, 0, 255)
_G.AimbotKey = Enum.UserInputType.MouseButton2

-- ==========================================
-- 2. BUILD TOGGLE GUI
-- ==========================================
if CoreGui:FindFirstChild("AmbaHubGui") then
    CoreGui.AmbaHubGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmbaHubGui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- --- Main Panel ---
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -100, 0.4, -60)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Visible = true

local UICorner_Main = Instance.new("UICorner")
UICorner_Main.CornerRadius = UDim.new(0, 10)
UICorner_Main.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Text = "AMBA.HUB by pinguin"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(255, 0, 150)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.Code
Title.TextSize = 16

-- --- Tombol ESP ---
local ESPBtn = Instance.new("TextButton")
ESPBtn.Parent = MainFrame
ESPBtn.Text = "ESP: ON"
ESPBtn.Size = UDim2.new(0.8, 0, 0, 30)
ESPBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
ESPBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ESPBtn.TextColor3 = Color3.new(1, 1, 1)
ESPBtn.Font = Enum.Font.SourceSans
ESPBtn.TextSize = 16
Instance.new("UICorner", ESPBtn)

-- --- Tombol AIM ---
local AimBtn = Instance.new("TextButton")
AimBtn.Parent = MainFrame
AimBtn.Text = "AIM: ON"
AimBtn.Size = UDim2.new(0.8, 0, 0, 30)
AimBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
AimBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AimBtn.TextColor3 = Color3.new(1, 1, 1)
AimBtn.Font = Enum.Font.SourceSans
AimBtn.TextSize = 16
Instance.new("UICorner", AimBtn)

-- --- Tombol HIDE ---
local HideBtn = Instance.new("TextButton")
HideBtn.Parent = MainFrame
HideBtn.Text = "CLOSE MENU"
HideBtn.Size = UDim2.new(0.8, 0, 0, 25)
HideBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
HideBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
HideBtn.TextColor3 = Color3.new(1, 1, 1)
HideBtn.Font = Enum.Font.SourceSansBold
HideBtn.TextSize = 14
Instance.new("UICorner", HideBtn)

-- --- Mini Toggle ---
local OpenBtn = Instance.new("TextButton")
OpenBtn.Parent = ScreenGui
OpenBtn.Text = "X"
OpenBtn.Size = UDim2.new(0, 40, 0, 40)
OpenBtn.Position = UDim2.new(0, 10, 0.5, -20)
OpenBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 150)
OpenBtn.TextColor3 = Color3.new(1, 1, 1)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.TextSize = 24
OpenBtn.Visible = false
local UICorner_Open = Instance.new("UICorner")
UICorner_Open.CornerRadius = UDim.new(1, 0)
UICorner_Open.Parent = OpenBtn

-- ==========================================
-- 3. LOGIC
-- ==========================================
ESPBtn.MouseButton1Click:Connect(function()
    _G.ESPEnabled = not _G.ESPEnabled
    ESPBtn.Text = _G.ESPEnabled and "ESP: ON" or "ESP: OFF"
    ESPBtn.BackgroundColor3 = _G.ESPEnabled and Color3.fromRGB(40, 40, 40) or Color3.fromRGB(80, 0, 0)
end)

AimBtn.MouseButton1Click:Connect(function()
    _G.AimbotEnabled = not _G.AimbotEnabled
    AimBtn.Text = _G.AimbotEnabled and "AIM: ON" or "AIM: OFF"
    AimBtn.BackgroundColor3 = _G.AimbotEnabled and Color3.fromRGB(40, 40, 40) or Color3.fromRGB(80, 0, 0)
end)

HideBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenBtn.Visible = false
end)

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Visible = true
FOVCircle.Color = _G.CircleColor

local function GetTarget()
    local target, dist = nil, _G.CircleRadius
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
            local pos, vis = Camera:WorldToViewportPoint(p.Character.Head.Position)
            if vis then
                local m = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if m < dist then dist = m target = p.Character.Head end
            end
        end
    end
    return target
end

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    FOVCircle.Visible = _G.AimbotEnabled
    if _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and not p.Character:FindFirstChild("Highlight") then
                local hl = Instance.new("Highlight", p.Character)
                hl.FillColor = Color3.fromRGB(255, 0, 100)
            end
        end
    end
    if _G.AimbotEnabled and UserInputService:IsMouseButtonPressed(_G.AimbotKey) then
        local h = GetTarget()
        if h then Camera.CFrame = CFrame.new(Camera.CFrame.Position, h.Position) end
    end
end)
