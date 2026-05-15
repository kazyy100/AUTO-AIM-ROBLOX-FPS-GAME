-- AMBA.HUB - Pinguin Supreme --
-- THE ULTIMATE FULL VERSION V2 (FPS BOOST ADDED) --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

-- SETTINGS
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

-- MINI BUTTON
local MiniBox = Instance.new("TextButton")
MiniBox.Parent = ScreenGui
MiniBox.Size = UDim2.new(0, 45, 0, 45)
MiniBox.Position = UDim2.new(0.02, 0, 0.9, 0)
MiniBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MiniBox.BorderSizePixel = 2
MiniBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
MiniBox.Text = "A"
MiniBox.TextColor3 = Color3.new(1, 1, 1)
MiniBox.TextSize = 25
MiniBox.Font = Enum.Font.SourceSansBold
MiniBox.Visible = false
MiniBox.ZIndex = 25

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
MainFrame.Size = UDim2.new(0, 550, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 1

-- BG 1: MAIN & BOOST (SASUKE)
local MainBg = Instance.new("ImageLabel")
MainBg.Parent = MainFrame
MainBg.BackgroundTransparency = 1
MainBg.Size = UDim2.new(1, 0, 1, 0)
MainBg.Image = "rbxassetid://121562925685767"
MainBg.ImageTransparency = 0.4
MainBg.ZIndex = 2

-- BG 2: INFO (CUSTOM)
local InfoBg = Instance.new("ImageLabel")
InfoBg.Parent = MainFrame
InfoBg.BackgroundTransparency = 1
InfoBg.Size = UDim2.new(1, 0, 1, 0)
InfoBg.Image = "rbxassetid://116967325385510"
InfoBg.ImageTransparency = 0.4
InfoBg.ZIndex = 2
InfoBg.Visible = false

-- TOP BAR (TAB CONTAINER)
local TabBar = Instance.new("Frame")
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TabBar.Size = UDim2.new(1, 0, 0, 50) -- Ditinggiin dikit
TabBar.ZIndex = 4

local Title = Instance.new("TextLabel")
Title.Parent = TabBar
Title.Size = UDim2.new(0.3, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "  AMBA.HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.Font = Enum.Font.SourceSansBold
Title.ZIndex = 5

-- TABS (PERBESAR & PERJELAS)
local function CreateTabBtn(text, pos, sizeX)
    local btn = Instance.new("TextButton")
    btn.Parent = TabBar
    btn.Position = pos
    btn.Size = UDim2.new(sizeX, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18 -- Ukuran teks tab diperbesar
    btn.ZIndex = 5
    return btn
end

local MainTabBtn = CreateTabBtn("MAIN", UDim2.new(0.3, 0, 0, 0), 0.15)
local BoostTabBtn = CreateTabBtn("BOOST FPS", UDim2.new(0.48, 0, 0, 0), 0.2) -- Tengah
local InfoTabBtn = CreateTabBtn("INFO", UDim2.new(0.7, 0, 0, 0), 0.15)

MainTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255) -- Aktif awal

-- MINIMIZE
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TabBar
MinimizeBtn.Position = UDim2.new(1, -45, 0, 10)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.new(1, 1, 1)
MinimizeBtn.ZIndex = 10

-- PAGES
local MainPage = Instance.new("Frame")
MainPage.Parent = MainFrame
MainPage.BackgroundTransparency = 1
MainPage.Position = UDim2.new(0, 0, 0.15, 0)
MainPage.Size = UDim2.new(1, 0, 0.85, 0)
MainPage.Visible = true
MainPage.ZIndex = 6

local BoostPage = Instance.new("Frame")
BoostPage.Parent = MainFrame
BoostPage.BackgroundTransparency = 1
BoostPage.Position = UDim2.new(0, 0, 0.15, 0)
BoostPage.Size = UDim2.new(1, 0, 0.85, 0)
BoostPage.Visible = false
BoostPage.ZIndex = 6

local InfoPage = Instance.new("Frame")
InfoPage.Parent = MainFrame
InfoPage.BackgroundTransparency = 1
InfoPage.Position = UDim2.new(0, 0, 0.15, 0)
InfoPage.Size = UDim2.new(1, 0, 0.85, 0)
InfoPage.Visible = false
InfoPage.ZIndex = 6

-- CONTENT BUILDER
local function CreateActionBtn(parent, text, pos)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Position = pos
    btn.Size = UDim2.new(0, 250, 0, 55)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 18
    btn.Font = Enum.Font.SourceSansBold
    btn.ZIndex = 7
    return btn
end

-- PAGE: MAIN
local AimBtn = CreateActionBtn(MainPage, "AUTO AIM: OFF", UDim2.new(0.5, -125, 0.2, 0))
local EspBtn = CreateActionBtn(MainPage, "ESP: OFF", UDim2.new(0.5, -125, 0.5, 0))

-- PAGE: BOOST
local FpsBtn = CreateActionBtn(BoostPage, "FPS BOOST", UDim2.new(0.5, -125, 0.2, 0))
local PingBtn = CreateActionBtn(BoostPage, "PING OPTIMIZER", UDim2.new(0.5, -125, 0.5, 0))

-- PAGE: INFO
local InfoTitle = Instance.new("TextLabel")
InfoTitle.Parent = InfoPage
InfoTitle.Size = UDim2.new(1, 0, 0.3, 0)
InfoTitle.Position = UDim2.new(0, 0, 0.1, 0)
InfoTitle.BackgroundTransparency = 1
InfoTitle.Text = "Script ini dibuat oleh pinguin\nIndonesian Programmer"
InfoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoTitle.TextSize = 22
InfoTitle.Font = Enum.Font.SourceSansBold
InfoTitle.ZIndex = 7

local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Parent = InfoPage
DiscordBtn.Size = UDim2.new(0.6, 0, 0.15, 0)
DiscordBtn.Position = UDim2.new(0.2, 0, 0.5, 0)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.Text = "JOIN DISCORD"
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBtn.TextSize = 18
DiscordBtn.Font = Enum.Font.SourceSansBold
DiscordBtn.ZIndex = 7

-- TAB LOGIC
local function SwitchTab(tab)
    MainPage.Visible = (tab == "Main")
    BoostPage.Visible = (tab == "Boost")
    InfoPage.Visible = (tab == "Info")
    
    MainBg.Visible = (tab ~= "Info")
    InfoBg.Visible = (tab == "Info")
    
    MainTabBtn.TextColor3 = (tab == "Main" and Color3.new(1,1,1) or Color3.fromRGB(150,150,150))
    BoostTabBtn.TextColor3 = (tab == "Boost" and Color3.new(1,1,1) or Color3.fromRGB(150,150,150))
    InfoTabBtn.TextColor3 = (tab == "Info" and Color3.new(1,1,1) or Color3.fromRGB(150,150,150))
end

MainTabBtn.MouseButton1Click:Connect(function() SwitchTab("Main") end)
BoostTabBtn.MouseButton1Click:Connect(function() SwitchTab("Boost") end)
InfoTabBtn.MouseButton1Click:Connect(function() SwitchTab("Info") end)

-- FPS BOOST LOGIC
FpsBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("DataModelMesh") or v:IsA("CharacterMesh") or v:IsA("BasePart") then
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.CastShadow = false
            end
        end
    end
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    settings().Rendering.QualityLevel = 1
    FpsBtn.Text = "FPS BOOST: ENABLED"
    FpsBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
end)

-- PING OPTIMIZER LOGIC
PingBtn.MouseButton1Click:Connect(function()
    settings().Network.IncomingReplicationLag = 0
    PingBtn.Text = "PING OPTIMIZED"
    PingBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
end)

-- SISTEM TOGGLE & LOOP (SAMA SEPERTI SEBELUMNYA)
MinimizeBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false; MiniBox.Visible = true end)
MiniBox.MouseButton1Click:Connect(function() MainFrame.Visible = true; MiniBox.Visible = false end)

DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard("https://discord.gg/v8TN6y6Xut") end
    DiscordBtn.Text = "COPIED!"; task.wait(2); DiscordBtn.Text = "JOIN DISCORD"
end)

AimBtn.MouseButton1Click:Connect(function()
    _G.AimbotEnabled = not _G.AimbotEnabled
    AimBtn.Text = "AUTO AIM: " .. (_G.AimbotEnabled and "ON" or "OFF")
end)

EspBtn.MouseButton1Click:Connect(function()
    _G.ESPEnabled = not _G.ESPEnabled
    EspBtn.Text = "ESP: " .. (_G.ESPEnabled and "ON" or "OFF")
    if not _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("AMBA_ESP") then p.Character.AMBA_ESP:Destroy() end
        end
    end
end)

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
        local target, maxDist = nil, _G.CircleRadius
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, vis = Camera:WorldToViewportPoint(p.Character.Head.Position)
                if vis then
                    local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if mag < maxDist then target, maxDist = p.Character.Head, mag end
                end
            end
        end
        if target then Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position) end
    end
end)

print("AMBA.HUB V2 LOADED! 🖕😈")
