-- AMBA.HUB - Pinguin Supreme --
-- TABBED EDITION (MAIN & INFO) --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- SETTINGS AWAL
_G.AimbotEnabled = false
_G.ESPEnabled = false
_G.CircleRadius = 150

-- CLEANUP
if game:GetService("CoreGui"):FindFirstChild("AMBA.HUB") then
    game:GetService("CoreGui")["AMBA.HUB"]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AMBA.HUB"
ScreenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- MAIN FRAME
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

-- BACKGROUND SASUKE
local BgImage = Instance.new("ImageLabel")
BgImage.Name = "SasukeBg"
BgImage.Parent = MainFrame
BgImage.BackgroundTransparency = 1
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.Image = "rbxassetid://121562925685767"
BgImage.ImageTransparency = 0.4
BgImage.ZIndex = 2

-- TAB BAR (BAGIAN ATAS)
local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TabBar.BorderSizePixel = 0
TabBar.Position = UDim2.new(0, 0, 0, 0)
TabBar.Size = UDim2.new(1, 0, 0, 45)
TabBar.ZIndex = 4

local Title = Instance.new("TextLabel")
Title.Parent = TabBar
Title.Size = UDim2.new(0.4, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "  AMBA.HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.SourceSansBold
Title.ZIndex = 5

-- BUTTONS UNTUK PINDAH TAB
local MainTabBtn = Instance.new("TextButton")
MainTabBtn.Parent = TabBar
MainTabBtn.Position = UDim2.new(0.5, 0, 0, 0)
MainTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
MainTabBtn.BackgroundTransparency = 1
MainTabBtn.Text = "MAIN"
MainTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTabBtn.Font = Enum.Font.SourceSansBold
MainTabBtn.TextSize = 16
MainTabBtn.ZIndex = 5

local InfoTabBtn = Instance.new("TextButton")
InfoTabBtn.Parent = TabBar
InfoTabBtn.Position = UDim2.new(0.7, 0, 0, 0)
InfoTabBtn.Size = UDim2.new(0.2, 0, 1, 0)
InfoTabBtn.BackgroundTransparency = 1
InfoTabBtn.Text = "INFO"
InfoTabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
InfoTabBtn.Font = Enum.Font.SourceSansBold
InfoTabBtn.TextSize = 16
InfoTabBtn.ZIndex = 5

-- PAGES
local MainPage = Instance.new("Frame")
MainPage.Name = "MainPage"
MainPage.Parent = MainFrame
MainPage.BackgroundTransparency = 1
MainPage.Position = UDim2.new(0, 0, 0.15, 0)
MainPage.Size = UDim2.new(1, 0, 0.85, 0)
MainPage.Visible = true
MainPage.ZIndex = 3

local InfoPage = Instance.new("Frame")
InfoPage.Name = "InfoPage"
InfoPage.Parent = MainFrame
InfoPage.BackgroundTransparency = 1
InfoPage.Position = UDim2.new(0, 0, 0.15, 0)
InfoPage.Size = UDim2.new(1, 0, 0.85, 0)
InfoPage.Visible = false
InfoPage.ZIndex = 3

-- ISI TAB MAIN (TOMBOL CHEAT)
local function CreateBtn(text, pos)
    local btn = Instance.new("TextButton")
    btn.Parent = MainPage
    btn.Position = pos
    btn.Size = UDim2.new(0, 250, 0, 55)
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

local AimBtn = CreateBtn("AUTO AIM", UDim2.new(0.5, -125, 0.2, 0))
local EspBtn = CreateBtn("ESP", UDim2.new(0.5, -125, 0.5, 0))

-- ISI TAB INFO
local InfoText = Instance.new("TextLabel")
InfoText.Parent = InfoPage
InfoText.Size = UDim2.new(0.8, 0, 0.6, 0)
InfoText.Position = UDim2.new(0.1, 0, 0.1, 0)
InfoText.BackgroundTransparency = 1
InfoText.Text = "Script ini dibuat oleh pinguin76pekob indonesian programmer\n\nJoin our discord:\nhttps://discord.gg/v8TN6y6Xut"
InfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoText.TextSize = 20
InfoText.Font = Enum.Font.SourceSansItalic
InfoText.TextWrapped = true
InfoText.ZIndex = 6

-- LOGIC PINDAH TAB
MainTabBtn.MouseButton1Click:Connect(function()
    MainPage.Visible = true
    InfoPage.Visible = false
    MainTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    InfoTabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
end)

InfoTabBtn.MouseButton1Click:Connect(function()
    MainPage.Visible = false
    InfoPage.Visible = true
    MainTabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    InfoTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- TOGGLE LOGIC (AIM & ESP)
AimBtn.MouseButton1Click:Connect(function()
    _G.AimbotEnabled = not _G.AimbotEnabled
    AimBtn.Text = "AUTO AIM: " .. (_G.AimbotEnabled and "ON" or "OFF")
end)

EspBtn.MouseButton1Click:Connect(function()
    _G.ESPEnabled = not _G.ESPEnabled
    EspBtn.Text = "ESP: " .. (_G.ESPEnabled and "ON" or "OFF")
    if not _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("AMBA_ESP") then
                p.Character.AMBA_ESP:Destroy()
            end
        end
    end
end)

-- NEON BAR & MINIMIZE (TETEP ADA)
local NeonBar = Instance.new("Frame")
NeonBar.Parent = MainFrame
NeonBar.Size = UDim2.new(1, 0, 0, 4)
NeonBar.Position = UDim2.new(0, 0, 1, -4)
NeonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NeonBar.ZIndex = 4

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TabBar
MinimizeBtn.Position = UDim2.new(1, -40, 0, 7)
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
MiniBox.Text = "A"
MiniBox.TextColor3 = Color3.new(1, 1, 1)
MiniBox.Visible = false

MinimizeBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false; MiniBox.Visible = true end)
MiniBox.MouseButton1Click:Connect(function() MainFrame.Visible = true; MiniBox.Visible = false end)

-- RUNSERVICE LOOP
RunService.RenderStepped:Connect(function()
    if _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and not p.Character:FindFirstChild("AMBA_ESP") then
                local h = Instance.new("Highlight", p.Character)
                h.Name = "AMBA_ESP"
                h.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    end
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
        if target then Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position) end
    end
end)

print("AMBA.HUB SUPREME TABBED EDITION LOADED!")
