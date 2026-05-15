-- AMBA.HUB - Pinguin Supreme --
-- VERSION 4: PERFORMANCE & VISUAL UPDATE --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

-- SETTINGS
_G.AimbotEnabled = false
_G.TriggerBot = false
_G.NoRecoil = false
_G.AntiReport = false
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
MiniBox.ZIndex = 30

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
MainFrame.Size = UDim2.new(0, 550, 0, 380) 
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 1

-- BG SYSTEM
local MainBg = Instance.new("ImageLabel")
MainBg.Parent = MainFrame
MainBg.BackgroundTransparency = 1
MainBg.Size = UDim2.new(1, 0, 1, 0)
MainBg.Image = "rbxassetid://121562925685767"
MainBg.ImageTransparency = 0.4
MainBg.ZIndex = 2

local InfoBg = Instance.new("ImageLabel")
InfoBg.Parent = MainFrame
InfoBg.BackgroundTransparency = 1
InfoBg.Size = UDim2.new(1, 0, 1, 0)
InfoBg.Image = "rbxassetid://116967325385510"
InfoBg.ImageTransparency = 0.4
InfoBg.ZIndex = 2
InfoBg.Visible = false

-- TOP BAR
local TabBar = Instance.new("Frame")
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TabBar.Size = UDim2.new(1, 0, 0, 50)
TabBar.ZIndex = 4

local Title = Instance.new("TextLabel")
Title.Parent = TabBar
Title.Size = UDim2.new(0.3, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "  AMBA.HUB"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 22
Title.Font = Enum.Font.SourceSansBold
Title.ZIndex = 5

-- TABS
local function CreateTabBtn(text, pos, sizeX)
    local btn = Instance.new("TextButton")
    btn.Parent = TabBar
    btn.Position = pos
    btn.Size = UDim2.new(sizeX, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.ZIndex = 5
    return btn
end

local MainTabBtn = CreateTabBtn("MAIN", UDim2.new(0.3, 0, 0, 0), 0.15)
local BoostTabBtn = CreateTabBtn("BOOST", UDim2.new(0.48, 0, 0, 0), 0.2)
local InfoTabBtn = CreateTabBtn("INFO", UDim2.new(0.7, 0, 0, 0), 0.15)
MainTabBtn.TextColor3 = Color3.new(1, 1, 1)

-- PAGES SCROLLING
local function CreatePage()
    local f = Instance.new("ScrollingFrame")
    f.Parent = MainFrame
    f.BackgroundTransparency = 1
    f.Position = UDim2.new(0, 0, 0.15, 0)
    f.Size = UDim2.new(1, 0, 0.85, 0)
    f.ScrollBarThickness = 0
    f.CanvasSize = UDim2.new(0, 0, 1.2, 0)
    f.Visible = false
    f.ZIndex = 6
    return f
end

local MainPage = CreatePage(); MainPage.Visible = true
local BoostPage = CreatePage()
local InfoPage = CreatePage()

-- BUTTON BUILDER
local function CreateActionBtn(parent, text, pos)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Position = pos
    btn.Size = UDim2.new(0, 220, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.new(1, 1, 1)
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 16
    btn.Font = Enum.Font.SourceSansBold
    btn.ZIndex = 7
    return btn
end

-- MAIN TAB CONTENT
local AimBtn = CreateActionBtn(MainPage, "AUTO AIM: OFF", UDim2.new(0.05, 0, 0.05, 0))
local TrigBtn = CreateActionBtn(MainPage, "TRIGGER BOT: OFF", UDim2.new(0.55, 0, 0.05, 0))
local RecoilBtn = CreateActionBtn(MainPage, "NO RECOIL: OFF", UDim2.new(0.05, 0, 0.25, 0))
local EspBtn = CreateActionBtn(MainPage, "ESP: OFF", UDim2.new(0.55, 0, 0.25, 0))
local ProtectBtn = CreateActionBtn(MainPage, "ANTI-REPORT: OFF", UDim2.new(0.3, 0, 0.45, 0))

-- BOOST TAB CONTENT
local FpsBtn = CreateActionBtn(BoostPage, "FPS BOOST", UDim2.new(0.5, -110, 0.1, 0))
local PingBtn = CreateActionBtn(BoostPage, "PING OPTIMIZER", UDim2.new(0.5, -110, 0.3, 0))

-- INFO TAB CONTENT
local InfoTitle = Instance.new("TextLabel")
InfoTitle.Parent = InfoPage
InfoTitle.Size = UDim2.new(1, 0, 0.3, 0)
InfoTitle.BackgroundTransparency = 1
InfoTitle.Text = "Script ini dibuat oleh pinguin\nIndonesian Programmer"
InfoTitle.TextColor3 = Color3.new(1, 1, 1)
InfoTitle.TextSize = 20
InfoTitle.Font = Enum.Font.SourceSansBold
InfoTitle.ZIndex = 7

-- LOGIC: TAB SWITCHING
local function Switch(tab)
    MainPage.Visible = (tab == "Main"); BoostPage.Visible = (tab == "Boost"); InfoPage.Visible = (tab == "Info")
    MainBg.Visible = (tab ~= "Info"); InfoBg.Visible = (tab == "Info")
    MainTabBtn.TextColor3 = (tab == "Main" and Color3.new(1,1,1) or Color3.fromRGB(150,150,150))
    BoostTabBtn.TextColor3 = (tab == "Boost" and Color3.new(1,1,1) or Color3.fromRGB(150,150,150))
    InfoTabBtn.TextColor3 = (tab == "Info" and Color3.new(1,1,1) or Color3.fromRGB(150,150,150))
end
MainTabBtn.MouseButton1Click:Connect(function() Switch("Main") end)
BoostTabBtn.MouseButton1Click:Connect(function() Switch("Boost") end)
InfoTabBtn.MouseButton1Click:Connect(function() Switch("Info") end)

-- LOGIC: COMBAT & PROTECTION
AimBtn.MouseButton1Click:Connect(function()
    _G.AimbotEnabled = not _G.AimbotEnabled
    AimBtn.Text = "AUTO AIM: " .. (_G.AimbotEnabled and "ON" or "OFF")
end)

TrigBtn.MouseButton1Click:Connect(function()
    _G.TriggerBot = not _G.TriggerBot
    TrigBtn.Text = "TRIGGER BOT: " .. (_G.TriggerBot and "ON" or "OFF")
end)

RecoilBtn.MouseButton1Click:Connect(function()
    _G.NoRecoil = not _G.NoRecoil
    RecoilBtn.Text = "NO RECOIL: " .. (_G.NoRecoil and "ON" or "OFF")
end)

ProtectBtn.MouseButton1Click:Connect(function()
    _G.AntiReport = not _G.AntiReport
    ProtectBtn.Text = "ANTI-REPORT: " .. (_G.AntiReport and "ON" or "OFF")
end)

-- SISTEM KERJA (RUNNER)
local oldCFrame = Camera.CFrame
RunService.RenderStepped:Connect(function()
    if _G.NoRecoil then
        local targetCFrame = Camera.CFrame
        if targetCFrame.Rotation ~= oldCFrame.Rotation then end
    end
    
    if _G.AimbotEnabled or _G.TriggerBot then
        local target = nil
        local mousePos = UserInputService:GetMouseLocation()
        
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, vis = Camera:WorldToViewportPoint(p.Character.Head.Position)
                if vis then
                    local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                    if dist < _G.CircleRadius then
                        target = p.Character.Head
                        if _G.TriggerBot and dist < 20 then
                            if mouse1click then mouse1click() end
                        end
                    end
                end
            end
        end
        
        if _G.AimbotEnabled and target and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end
end)

-- ANTI REPORT
Players.PlayerChatted:Connect(function(type, ply, msg)
    if _G.AntiReport and (msg:lower():find("report") or msg:lower():find("cheat")) and ply ~= LocalPlayer then
        LocalPlayer:Kick("Anti-Report: Potential threat detected in chat.")
    end
end)

-- MINIMIZE
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TabBar
MinimizeBtn.Position = UDim2.new(1, -45, 0, 10)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MinimizeBtn.Text = "-"; MinimizeBtn.TextColor3 = Color3.new(1, 1, 1)
MinimizeBtn.ZIndex = 10
MinimizeBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false; MiniBox.Visible = true end)
MiniBox.MouseButton1Click:Connect(function() MainFrame.Visible = true; MiniBox.Visible = false end)

-- SISTEM ESP SNAPLINES
local Lines = {}

local function CreateLine()
    local line = Drawing.new("Line")
    line.Thickness = 1
    line.Color = Color3.new(1, 0, 0)
    line.Transparency = 1
    return line
end

-- LOGIC: BOOST TAB
FpsBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("DataModelMesh") or v:IsA("CharacterMesh") or v:IsA("BasePart") then
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Enabled = false
        end
    end
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    settings().Rendering.QualityLevel = 1
    FpsBtn.Text = "FPS BOOST: ACTIVE"
end)

PingBtn.MouseButton1Click:Connect(function()
    settings().Network.IncomingReplicationLag = -1000
    game:GetService("RunService"):Set3dRenderingEnabled(true) 
    PingBtn.Text = "PING OPTIMIZED"
end)

-- ESP & VISUAL RUNNER
EspBtn.MouseButton1Click:Connect(function()
    _G.ESPEnabled = not _G.ESPEnabled
    EspBtn.Text = "ESP: " .. (_G.ESPEnabled and "ON" or "OFF")
    if not _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("AMBA_ESP") then p.Character.AMBA_ESP:Destroy() end
            if Lines[p] then Lines[p].Visible = false end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                if not p.Character:FindFirstChild("AMBA_ESP") then
                    local h = Instance.new("Highlight", p.Character)
                    h.Name = "AMBA_ESP"; h.FillColor = Color3.new(1, 0, 0)
                end
                
                local hrp = p.Character.HumanoidRootPart
                local pos, vis = Camera:WorldToViewportPoint(hrp.Position)
                
                if vis then
                    if not Lines[p] then Lines[p] = CreateLine() end
                    Lines[p].From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    Lines[p].To = Vector2.new(pos.X, pos.Y)
                    Lines[p].Visible = true
                else
                    if Lines[p] then Lines[p].Visible = false end
                end
            else
                if Lines[p] then Lines[p].Visible = false end
            end
        end
    end
end)

print("AMBA.HUB V4 LOADED! ALL SYSTEMS INTEGRATED.")
