-- AMBA.HUB - Pinguin Supreme --
-- MANUAL TOGGLE EDITION --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- SETTINGS AWAL (MATI SEMUA PAS AWAL LOAD)
_G.AimbotEnabled = false
_G.ESPEnabled = false
_G.CircleRadius = 150

-- CLEANUP BIAR GAK DOUBLE
if game:GetService("CoreGui"):FindFirstChild("AMBA.HUB") then
    game:GetService("CoreGui")["AMBA.HUB"]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AMBA.HUB"
ScreenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- MAIN FRAME (WIDE & CENTERED)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
MainFrame.Size = UDim2.new(0, 550, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 1

-- BACKGROUND SASUKE (rbxassetid://121562925685767)
local BgImage = Instance.new("ImageLabel")
BgImage.Name = "SasukeBg"
BgImage.Parent = MainFrame
BgImage.BackgroundTransparency = 1
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.Image = "rbxassetid://121562925685767"
BgImage.ImageTransparency = 0.4
BgImage.ZIndex = 2 -- DI ATAS FRAME HITAM

-- LAMPU NEON BAWAH (HITAM PUTIH)
local NeonBar = Instance.new("Frame")
NeonBar.Parent = MainFrame
NeonBar.Size = UDim2.new(1, 0, 0, 4)
NeonBar.Position = UDim2.new(0, 0, 1, -4)
NeonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NeonBar.BorderSizePixel = 0
NeonBar.ZIndex = 4

-- TITLE
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Title.Text = "  AMBA.HUB - Pinguin"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.SourceSansBold
Title.ZIndex = 4

-- CONTAINER TOMBOL (CENTERED)
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Parent = MainFrame
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Position = UDim2.new(0.5, -125, 0.4, 0)
ButtonContainer.Size = UDim2.new(0, 250, 0, 200)
ButtonContainer.ZIndex = 5

local function CreateBtn(text, pos)
    local btn = Instance.new("TextButton")
    btn.Parent = ButtonContainer
    btn.Position = pos
    btn.Size = UDim2.new(1, 0, 0, 55)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 18
    btn.Font = Enum.Font.SourceSansBold
    btn.ZIndex = 6
    return btn
end

local AimBtn = CreateBtn("AUTO AIM", UDim2.new(0, 0, 0, 0))
local EspBtn = CreateBtn("ESP", UDim2.new(0, 0, 0, 75))

-- MANUAL TOGGLE LOGIC
AimBtn.MouseButton1Click:Connect(function()
    _G.AimbotEnabled = not _G.AimbotEnabled
    AimBtn.Text = "AUTO AIM: " .. (_G.AimbotEnabled and "ON" or "OFF")
end)

EspBtn.MouseButton1Click:Connect(function()
    _G.ESPEnabled = not _G.ESPEnabled
    EspBtn.Text = "ESP: " .. (_G.ESPEnabled and "ON" or "OFF")
    
    -- JIKA OFF, LANGSUNG BERSIHKAN SEMUA ESP
    if not _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("AMBA_ESP") then
                p.Character.AMBA_ESP:Destroy()
            end
        end
    end
end)

-- MINIMIZE
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = MainFrame
MinimizeBtn.Position = UDim2.new(1, -40, 0, 10)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.new(1, 1, 1)
MinimizeBtn.ZIndex = 10

local MiniBox = Instance.new("TextButton")
MiniBox.Parent = ScreenGui
MiniBox.Size = UDim2.new(0, 45, 0, 45)
MiniBox.Position = UDim2.new(0.02, 0, 0.9, 0)
MiniBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MiniBox.BorderSizePixel = 2
MiniBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
MiniBox.Text = "A"
MiniBox.TextColor3 = Color3.new(1, 1, 1)
MiniBox.Visible = false

MinimizeBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false; MiniBox.Visible = true end)
MiniBox.MouseButton1Click:Connect(function() MainFrame.Visible = true; MiniBox.Visible = false end)

-- MAIN LOOP (HANYA JALAN JIKA DI-ON KAN)
RunService.RenderStepped:Connect(function()
    -- MANUAL ESP
    if _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and not p.Character:FindFirstChild("AMBA_ESP") then
                local h = Instance.new("Highlight", p.Character)
                h.Name = "AMBA_ESP"
                h.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    end

    -- MANUAL AIMBOT
    if _G.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = nil
        local maxDist = _G.CircleRadius
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, vis = Camera:WorldToViewportPoint(p.Character.Head.Position)
                if vis then
                    local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if mag < maxDist then
                        target = p.Character.Head
                        maxDist = mag
                    end
                end
            end
        end
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end
end)

print("AMBA.HUB SUPREME MANUAL LOADED!")
