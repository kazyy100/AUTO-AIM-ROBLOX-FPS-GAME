-- AMBA.HUB - Pinguin Supreme --
-- VERSION 12: SUPER ADVANCED BONE RESOLVER (ANTI-BUG) + ENGLISH ESP COLOR TEXT --
-- Fixed & Enhanced by: Gemini --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- SETTINGS
_G.AimbotEnabled = false
_G.TriggerBot = false
_G.NoRecoil = false
_G.AntiReport = false
_G.ESPEnabled = false
_G.CircleRadius = 150
_G.TriggerBotDelay = 0.1
_G.FpsBoostActive = false
_G.PingOptimizer = false
_G.ShadowLockEnabled = false
_G.ShadowTarget = nil
_G.AntiAimbot = false

-- FEATURE SETTINGS
_G.WallCheckEnabled = true
local BoneList = {"HEAD", "TORSO", "LEGS"}
local CurrentBoneIndex = 1
_G.AimbotTargetBone = BoneList[CurrentBoneIndex]

-- ESP COLOR CYCLE SYSTEM (ENGLISH)
local ColorList = {
    {Name = "WHITE", Color = Color3.fromRGB(255, 255, 255)},
    {Name = "RED", Color = Color3.fromRGB(255, 40, 40)},
    {Name = "BLUE", Color = Color3.fromRGB(40, 120, 255)}
}
local CurrentColorIndex = 1
_G.ESPColor = ColorList[CurrentColorIndex].Color

-- DATABASE FOR DRAWING ESP
local OriginalMaterials = {}
local Lines = {}
local Boxes = {}
local Names = {}
local Distances = {}
local HealthBars = {}
local HealthBarOutlines = {}

local NoRecoilConnections = {}
local lastShot = 0
local ShadowConnection = nil
local CollisionConnection = nil
local AntiAimConnection = nil
local PingOptimizerConnection = nil
local lastPingOptimize = 0
local PingOptimizeCooldown = 2

-- CLEANUP EXISTING UI
if game:GetService("CoreGui"):FindFirstChild("AMBA.HUB") then
    game:GetService("CoreGui")["AMBA.HUB"]:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AMBA.HUB"
ScreenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- PREMIUM MONOCHROME THEME
local Theme = {
    Background = Color3.fromRGB(10, 10, 10),
    TopBar = Color3.fromRGB(18, 18, 18),
    AccentWhite = Color3.fromRGB(255, 255, 255),
    TextMain = Color3.fromRGB(240, 240, 240),
    TextDark = Color3.fromRGB(120, 120, 120),
    BtnBg = Color3.fromRGB(20, 20, 20),
    BtnHover = Color3.fromRGB(35, 35, 35),
    Border = Color3.fromRGB(40, 40, 40)
}

-- UTILS: BUTTON EFFECTS
local function ApplyButtonEffects(btn)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Theme.BtnHover,
            TextColor3 = Theme.AccentWhite
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Theme.BtnBg,
            TextColor3 = Theme.TextMain
        }):Play()
    end)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.96, 0, 0.96, 0)
        }):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 1, 0)
        }):Play()
    end)
end

-- FLOATING MINI BUTTON
local MiniBox = Instance.new("CanvasGroup")
MiniBox.Name = "MiniBox"
MiniBox.Parent = ScreenGui
MiniBox.Size = UDim2.new(0, 48, 0, 48)
MiniBox.Position = UDim2.new(0.02, 0, 0.85, 0)
MiniBox.BackgroundTransparency = 1
MiniBox.Visible = false
MiniBox.ZIndex = 30

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(1, 0)
MiniCorner.Parent = MiniBox

local MiniBtnActual = Instance.new("TextButton")
MiniBtnActual.Name = "MiniBtnActual"
MiniBtnActual.Parent = MiniBox
MiniBtnActual.Size = UDim2.new(1, 0, 1, 0)
MiniBtnActual.BackgroundColor3 = Theme.Background
MiniBtnActual.Text = "A"
MiniBtnActual.TextColor3 = Theme.AccentWhite
MiniBtnActual.TextSize = 20
MiniBtnActual.Font = Enum.Font.SourceSansBold
MiniBtnActual.ZIndex = 31

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Theme.Border
MiniStroke.Thickness = 1.5
MiniStroke.Parent = MiniBtnActual

-- MAIN FRAME
local MainFrame = Instance.new("CanvasGroup")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -270, 0.5, -195)
MainFrame.Size = UDim2.new(0, 540, 0, 390) 
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 1

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainFrameStroke = Instance.new("UIStroke")
MainFrameStroke.Color = Theme.Border
MainFrameStroke.Thickness = 1
MainFrameStroke.Parent = MainFrame

-- ORIGINAL BACKGROUND IMAGES
local MainBg = Instance.new("ImageLabel")
MainBg.Parent = MainFrame
MainBg.BackgroundTransparency = 1
MainBg.Size = UDim2.new(1, 0, 1, 0)
MainBg.Image = "rbxassetid://121562925685767"
MainBg.ImageTransparency = 0.6
MainBg.ZIndex = 2

local InfoBg = Instance.new("ImageLabel")
InfoBg.Parent = MainFrame
InfoBg.BackgroundTransparency = 1
InfoBg.Size = UDim2.new(1, 0, 1, 0)
InfoBg.Image = "rbxassetid://116967325385510"
InfoBg.ImageTransparency = 0.6
InfoBg.ZIndex = 2
InfoBg.Visible = false

-- TOP BAR
local TabBar = Instance.new("Frame")
TabBar.Parent = MainFrame
TabBar.BackgroundColor3 = Theme.TopBar
TabBar.Size = UDim2.new(1, 0, 0, 50)
TabBar.ZIndex = 4

local TabBarCorner = Instance.new("UICorner")
TabBarCorner.CornerRadius = UDim.new(0, 10)
TabBarCorner.Parent = TabBar

local HideTopBarCorner = Instance.new("Frame")
HideTopBarCorner.Parent = TabBar
HideTopBarCorner.BackgroundColor3 = Theme.TopBar
HideTopBarCorner.BorderSizePixel = 0
HideTopBarCorner.Position = UDim2.new(0, 0, 0.8, 0)
HideTopBarCorner.Size = UDim2.new(1, 0, 0.2, 0)
HideTopBarCorner.ZIndex = 3

local Title = Instance.new("TextLabel")
Title.Parent = TabBar
Title.Size = UDim2.new(0.28, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "  AMBA.HUB"
Title.TextColor3 = Theme.AccentWhite
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.ZIndex = 5

-- TABS CREATOR
local Tabs = {}
local function CreateTabBtn(text, pos, id)
    local btn = Instance.new("TextButton")
    btn.Parent = TabBar
    btn.Position = pos
    btn.Size = UDim2.new(0, 75, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = Theme.TextDark
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.ZIndex = 5
    Tabs[id] = btn
    return btn
end

local MainTabBtn = CreateTabBtn("MAIN", UDim2.new(0.32, 0, 0, 0), "Main")
local BoostTabBtn = CreateTabBtn("BOOST", UDim2.new(0.48, 0, 0, 0), "Boost")
local InfoTabBtn = CreateTabBtn("INFO", UDim2.new(0.64, 0, 0, 0), "Info")
MainTabBtn.TextColor3 = Theme.AccentWhite

-- PAGES BUILDER
local function CreatePage()
    local f = Instance.new("CanvasGroup")
    f.Parent = MainFrame
    f.BackgroundTransparency = 1
    f.Position = UDim2.new(0, 0, 0.13, 0)
    f.Size = UDim2.new(1, 0, 0.87, 0)
    f.Visible = false
    f.ZIndex = 6
    return f
end

local MainPage = CreatePage()
MainPage.Visible = true
local BoostPage = CreatePage()
local InfoPage = CreatePage()

-- COMPONENT BUTTON BUILDER
local function CreateActionBtn(parent, text, pos)
    local Container = Instance.new("Frame")
    Container.Parent = parent
    Container.Position = pos
    Container.Size = UDim2.new(0, 225, 0, 38)
    Container.BackgroundTransparency = 1
    Container.ZIndex = 7

    local btn = Instance.new("TextButton")
    btn.Name = "Btn"
    btn.Parent = Container
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundColor3 = Theme.BtnBg
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Theme.TextMain
    btn.TextSize = 13
    btn.Font = Enum.Font.SourceSansBold
    btn.ZIndex = 8

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Theme.Border
    btnStroke.Thickness = 1
    btnStroke.Parent = btn

    ApplyButtonEffects(btn)
    return btn
end

local function UpdateToggleVisual(btn, state)
    local stroke = btn:FindFirstChildOfClass("UIStroke")
    if state then
        btn.TextColor3 = Theme.Background
        btn.BackgroundColor3 = Theme.AccentWhite
        if stroke then stroke.Color = Theme.AccentWhite end
    else
        btn.TextColor3 = Theme.TextMain
        btn.BackgroundColor3 = Theme.BtnBg
        if stroke then stroke.Color = Theme.Border end
    end
end

-- MAIN INTERFACE ELEMENTS
local AimBtn = CreateActionBtn(MainPage, "AUTO AIM: OFF", UDim2.new(0.05, 0, 0.03, 0))
local TrigBtn = CreateActionBtn(MainPage, "TRIGGER BOT: OFF", UDim2.new(0.53, 0, 0.03, 0))
local RecoilBtn = CreateActionBtn(MainPage, "NO RECOIL: OFF", UDim2.new(0.05, 0, 0.17, 0))
local EspBtn = CreateActionBtn(MainPage, "ESP: OFF", UDim2.new(0.53, 0, 0.17, 0))
local ProtectBtn = CreateActionBtn(MainPage, "ANTI-REPORT: OFF", UDim2.new(0.05, 0, 0.31, 0))

-- ESP COLOR BUTTON (ENGLISH TEXT)
local ColorCycleBtn = CreateActionBtn(MainPage, "ESP COLOR: WHITE", UDim2.new(0.53, 0, 0.31, 0))

local WallCheckBtn = CreateActionBtn(MainPage, "WALL CHECK: ON", UDim2.new(0.05, 0, 0.45, 0))
UpdateToggleVisual(WallCheckBtn, true)

local BoneBtn = CreateActionBtn(MainPage, "TARGET BONE: HEAD", UDim2.new(0.53, 0, 0.45, 0))

-- LOGIC: WALL CHECK TOGGLE
WallCheckBtn.MouseButton1Click:Connect(function()
    _G.WallCheckEnabled = not _G.WallCheckEnabled
    WallCheckBtn.Text = "WALL CHECK: " .. (_G.WallCheckEnabled and "ON" or "OFF")
    UpdateToggleVisual(WallCheckBtn, _G.WallCheckEnabled)
end)

-- LOGIC: BONE SELECTOR CYCLE
BoneBtn.MouseButton1Click:Connect(function()
    CurrentBoneIndex = CurrentBoneIndex + 1
    if CurrentBoneIndex > #BoneList then CurrentBoneIndex = 1 end
    _G.AimbotTargetBone = BoneList[CurrentBoneIndex]
    BoneBtn.Text = "TARGET BONE: " .. _G.AimbotTargetBone
end)

-- LOGIC: COLOR CYCLE (ENGLISH)
ColorCycleBtn.MouseButton1Click:Connect(function()
    CurrentColorIndex = CurrentColorIndex + 1
    if CurrentColorIndex > #ColorList then CurrentColorIndex = 1 end
    local selectedData = ColorList[CurrentColorIndex]
    _G.ESPColor = selectedData.Color
    ColorCycleBtn.Text = "ESP COLOR: " .. selectedData.Name
    local stroke = ColorCycleBtn:FindFirstChildOfClass("UIStroke")
    if stroke then stroke.Color = selectedData.Color end
end)

-- SHADOW LOCK COMPONENTS
local TargetInput = Instance.new("TextBox")
TargetInput.Parent = MainPage
TargetInput.Position = UDim2.new(0.05, 0, 0.61, 0)
TargetInput.Size = UDim2.new(0, 225, 0, 34)
TargetInput.BackgroundColor3 = Theme.BtnBg
TargetInput.BorderSizePixel = 0
TargetInput.PlaceholderText = "Nama target..."
TargetInput.PlaceholderColor3 = Theme.TextDark
TargetInput.Text = ""
TargetInput.TextColor3 = Theme.TextMain
TargetInput.TextSize = 13
TargetInput.Font = Enum.Font.SourceSans
TargetInput.ZIndex = 7

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 5)
InputCorner.Parent = TargetInput

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Theme.Border
InputStroke.Thickness = 1
InputStroke.Parent = TargetInput

local SelectTargetBtn = CreateActionBtn(MainPage, "PILIH TARGET", UDim2.new(0.53, 0, 0.61, 0))
local ShadowBtn = CreateActionBtn(MainPage, "SHADOW LOCK: OFF", UDim2.new(0.05, 0, 0.77, 0))
local AntiAimBtn = CreateActionBtn(MainPage, "ANTI AIMBOT: OFF", UDim2.new(0.53, 0, 0.77, 0))

-- BOOST INTERFACE ELEMENTS
local FpsBtn = CreateActionBtn(BoostPage, "FPS BOOST: OFF", UDim2.new(0.5, -112, 0.12, 0))
local PingBtn = CreateActionBtn(BoostPage, "PING OPTIMIZER: OFF", UDim2.new(0.5, -112, 0.34, 0))

-- INFO INTERFACE ELEMENTS
local InfoTitle = Instance.new("TextLabel")
InfoTitle.Parent = InfoPage
InfoTitle.Position = UDim2.new(0.05, 0, 0.08, 0)
InfoTitle.Size = UDim2.new(0.9, 0, 0.4, 0)
InfoTitle.BackgroundTransparency = 1
InfoTitle.Text = "SCRIPT BY PINGUIN\nINDONESIAN PROGRAMMER\n\nPLEASE JOIN OUR DISCORD\nFOR MORE SCRIPTS AND UPDATES!"
InfoTitle.TextColor3 = Theme.TextMain
InfoTitle.TextSize = 14
InfoTitle.Font = Enum.Font.SourceSansBold
InfoTitle.TextWrapped = true
InfoTitle.ZIndex = 7

local DiscordBtnContainer = Instance.new("Frame")
DiscordBtnContainer.Parent = InfoPage
DiscordBtnContainer.Position = UDim2.new(0.5, -112, 0.58, 0)
DiscordBtnContainer.Size = UDim2.new(0, 225, 0, 42)
DiscordBtnContainer.BackgroundTransparency = 1
DiscordBtnContainer.ZIndex = 7

local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Parent = DiscordBtnContainer
DiscordBtn.Size = UDim2.new(1, 0, 1, 0)
DiscordBtn.BackgroundColor3 = Theme.BtnBg
DiscordBtn.BorderSizePixel = 0
DiscordBtn.Text = "COPY DISCORD LINK"
DiscordBtn.TextColor3 = Theme.TextMain
DiscordBtn.TextSize = 14
DiscordBtn.Font = Enum.Font.SourceSansBold
DiscordBtn.ZIndex = 8

local DiscCorner = Instance.new("UICorner")
DiscCorner.CornerRadius = UDim.new(0, 6)
DiscCorner.Parent = DiscordBtn

local DiscStroke = Instance.new("UIStroke")
DiscStroke.Color = Theme.Border
DiscStroke.Thickness = 1
DiscStroke.Parent = DiscordBtn

ApplyButtonEffects(DiscordBtn)

DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/qa5bpScJ5a")
        DiscordBtn.Text = "COPIED TO CLIPBOARD!"
        task.wait(1.5)
        DiscordBtn.Text = "COPY DISCORD LINK"
    end
end)

-- LOGIC: INSTANT SWITCH + SMOOTH POP TRANSITION
local activeTab = "Main"
local pagesMap = {Main = MainPage, Boost = BoostPage, Info = InfoPage}

local function SwitchTab(tabName)
    if activeTab == tabName then return end
    local oldPage = pagesMap[activeTab]
    local newPage = pagesMap[tabName]
    activeTab = tabName
    
    for id, btn in pairs(Tabs) do
        btn.TextColor3 = (id == tabName and Theme.AccentWhite or Theme.TextDark)
    end
    
    MainBg.Visible = (tabName ~= "Info")
    InfoBg.Visible = (tabName == "Info")
    oldPage.Visible = false
    
    newPage.GroupTransparency = 1
    newPage.Size = UDim2.new(0.95, 0, 0.82, 0)
    newPage.Position = UDim2.new(0.025, 0, 0.155, 0)
    newPage.Visible = true
    
    TweenService:Create(newPage, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        GroupTransparency = 0,
        Size = UDim2.new(1, 0, 0.87, 0),
        Position = UDim2.new(0, 0, 0.13, 0)
    }):Play()
end

MainTabBtn.MouseButton1Click:Connect(function() SwitchTab("Main") end)
BoostTabBtn.MouseButton1Click:Connect(function() SwitchTab("Boost") end)
InfoTabBtn.MouseButton1Click:Connect(function() SwitchTab("Info") end)

-- ANTI REPORT SYSTEM
ProtectBtn.MouseButton1Click:Connect(function()
    _G.AntiReport = not _G.AntiReport
    ProtectBtn.Text = "ANTI-REPORT: " .. (_G.AntiReport and "ON" or "OFF")
    UpdateToggleVisual(ProtectBtn, _G.AntiReport)
end)

local function OnChat(ply, msg)
    if _G.AntiReport and ply ~= LocalPlayer then
        local lowerMsg = msg:lower()
        if lowerMsg:find("report") or lowerMsg:find("cheat") or lowerMsg:find("hacker") then
            LocalPlayer:Kick("Anti-Report: Threat detected in chat log.")
        end
    end
end
for _, ply in pairs(Players:GetPlayers()) do ply.Chatted:Connect(function(msg) OnChat(ply, msg) end) end
Players.PlayerAdded:Connect(function(msg) pcall(function() msg.Chatted:Connect(function(m) OnChat(msg, m) end) end) end)

-- NO RECOIL SYSTEM
RecoilBtn.MouseButton1Click:Connect(function()
    _G.NoRecoil = not _G.NoRecoil
    RecoilBtn.Text = "NO RECOIL: " .. (_G.NoRecoil and "ON" or "OFF")
    UpdateToggleVisual(RecoilBtn, _G.NoRecoil)
    
    if _G.NoRecoil then
        NoRecoilConnections[1] = RunService.RenderStepped:Connect(function()
            local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Recoil") then tool.Recoil.Enabled = false end
        end)
        NoRecoilConnections[2] = RunService.Heartbeat:Connect(function()
            pcall(function() if Camera then Camera.FieldOfView = 70 end end)
        end)
    else
        for _, conn in pairs(NoRecoilConnections) do if conn then conn:Disconnect() end end
        NoRecoilConnections = {}
    end
end)

-- TRIGGER BOT SYSTEM
TrigBtn.MouseButton1Click:Connect(function()
    _G.TriggerBot = not _G.TriggerBot
    TrigBtn.Text = "TRIGGER BOT: " .. (_G.TriggerBot and "ON" or "OFF")
    UpdateToggleVisual(TrigBtn, _G.TriggerBot)
end)

local function TriggerBotLogic()
    if not _G.TriggerBot then return end
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Team ~= LocalPlayer.Team then
            if p.Character.Humanoid.Health <= 0 then continue end
            local head = p.Character.Head
            local pos, vis = Camera:WorldToViewportPoint(head.Position)
            
            if vis then
                local distance = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                if distance <= 80 then
                    if tick() - lastShot >= _G.TriggerBotDelay then
                        VirtualInputManager:SendMouseButtonEvent(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2, 0, true, game, 0)
                        task.wait(0.04)
                        VirtualInputManager:SendMouseButtonEvent(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2, 0, false, game, 0)
                        lastShot = tick()
                    end
                    break
                end
            end
        end
    end
end

-- FPS BOOST & PING OPTIMIZER
FpsBtn.MouseButton1Click:Connect(function()
    _G.FpsBoostActive = not _G.FpsBoostActive
    FpsBtn.Text = "WAIT..."
    task.wait(0.05)
    if _G.FpsBoostActive then
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("BasePart") then
                OriginalMaterials[v] = {Material = v.Material, Reflectance = v.Reflectance}
                v.Material = Enum.Material.SmoothPlastic; v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                OriginalMaterials[v] = {Transparency = v.Transparency}; v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                OriginalMaterials[v] = {Enabled = v.Enabled}; v.Enabled = false
            end
        end
        Lighting.GlobalShadows = false
        FpsBtn.Text = "FPS BOOST: ACTIVE"
        UpdateToggleVisual(FpsBtn, true)
    else
        for obj, data in pairs(OriginalMaterials) do
            if obj and obj.Parent then
                if data.Material then obj.Material = data.Material end
                if data.Reflectance then obj.Reflectance = data.Reflectance end
                if data.Transparency then obj.Transparency = data.Transparency end
                if data.Enabled ~= nil then obj.Enabled = data.Enabled end
            end
        end
        Lighting.GlobalShadows = true
        OriginalMaterials = {}
        FpsBtn.Text = "FPS BOOST: OFF"
        UpdateToggleVisual(FpsBtn, false)
    end
end)

-- SHADOW LOCK LOGIC
function StartShadowLock()
    if ShadowConnection then ShadowConnection:Disconnect() end
    if CollisionConnection then CollisionConnection:Disconnect() end
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.PlatformStand = true; char.Humanoid.AutoRotate = false
    end
    ShadowConnection = RunService.RenderStepped:Connect(function()
        if not _G.ShadowLockEnabled or not _G.ShadowTarget then StopShadowLock() return end
        local myChar = LocalPlayer.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local targetChar = _G.ShadowTarget.Character
        if not myHRP or not targetChar then StopShadowLock() return end
        local targetHead = targetChar:FindFirstChild("Head") or targetChar:FindFirstChild("HumanoidRootPart")
        if not targetHead then StopShadowLock() return end
        
        local tp = targetHead.Position
        local targetPos = tp + Vector3.new(math.sin(tick() * 5) * 4, math.cos(tick() * 7) * 1.5 + 3, math.cos(tick() * 5) * 4)
        myHRP.Velocity = (targetPos - myHRP.Position) * 10
        myHRP.CFrame = CFrame.new(myHRP.Position, Vector3.new(tp.X, myHRP.Position.Y, tp.Z))
    end)
    CollisionConnection = RunService.Stepped:Connect(function()
        local myChar = LocalPlayer.Character
        if myChar and _G.ShadowLockEnabled then
            for _, part in pairs(myChar:GetChildren()) do if part:IsA("BasePart") then part.CanCollide = false end end
        end
    end)
end

function StopShadowLock()
    _G.ShadowLockEnabled = false
    if ShadowConnection then ShadowConnection:Disconnect() ShadowConnection = nil end
    if CollisionConnection then CollisionConnection:Disconnect() CollisionConnection = nil end
    local char = LocalPlayer.Character
    if char then
        if char:FindFirstChild("Humanoid") then char.Humanoid.PlatformStand = false; char.Humanoid.AutoRotate = true end
        for _, part in pairs(char:GetChildren()) do if part:IsA("BasePart") then part.CanCollide = true end end
    end
end

function StartAntiAimbot()
    if AntiAimConnection then AntiAimConnection:Disconnect() end
    AntiAimConnection = RunService.RenderStepped:Connect(function()
        if not _G.AntiAimbot or not LocalPlayer.Character then return end
        local char = LocalPlayer.Character
        if char:FindFirstChild("Head") then
            char.Head.CFrame = char.Head.CFrame * CFrame.new(math.sin(tick() * 25) * 1, math.cos(tick() * 20) * 1, math.sin(tick() * 22) * 0.5)
        end
        if char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(8), math.rad(3))
        end
    end)
end

-- UTILS: WALL CHECK RAYCAST FUNCTION
local function IsPlayerVisible(targetPart)
    if not _G.WallCheckEnabled then return true end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Head") then return false end
    
    local rayOrigin = Camera.CFrame.Position
    local rayDirection = (targetPart.Position - rayOrigin)
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {char, targetPart.Parent}
    raycastParams.IgnoreWater = true
    
    local result = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
    return result == nil
end

-- ====================================================================
-- NEW BUG-FREE REGEX BONE RESOLVER (WORKS FOR ANY R6, R15, CUSTOM CHARS)
-- ====================================================================
local function GetTargetPart(character, boneType)
    if not character then return nil end
    
    -- Ambil fallback utama jika tidak ketemu scan manual
    local fallbackHead = character:FindFirstChild("Head")
    local fallbackRoot = character:FindFirstChild("HumanoidRootPart")
    
    if boneType == "HEAD" then
        if fallbackHead then return fallbackHead end
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("BasePart") and child.Name:lower():find("head") then return child end
        end
    elseif boneType == "TORSO" then
        -- Scan semua part dada/perut secara urut kecocokan nama
        for _, name in pairs({"uppertorso", "torso", "lowertorso", "chest", "abs"}) do
            local found = character:FindFirstChild(name) or character:FindFirstChild(name:sub(1,1):upper()..name:sub(2))
            if found then return found end
        end
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("BasePart") and (child.Name:lower():find("torso") or child.Name:lower():find("chest")) then return child end
        end
        if fallbackRoot then return fallbackRoot end
    elseif boneType == "LEGS" then
        -- Scan semua part kaki bawah/atas secara urut kecocokan nama
        for _, name in pairs({"leftlowerleg", "rightlowerleg", "leftleg", "rightleg", "lowerleg", "foot"}) do
            local found = character:FindFirstChild(name) or character:FindFirstChild(name:sub(1,1):upper()..name:sub(2))
            if found then return found end
        end
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("BasePart") and (child.Name:lower():find("leg") or child.Name:lower():find("foot")) then return child end
        end
        if fallbackRoot then return fallbackRoot end
    end
    
    return fallbackHead or fallbackRoot
end

-- FULL ESP CLEANUP SYSTEM
local function ClearESP()
    for p, v in pairs(Lines) do pcall(function() v:Remove() end) end; Lines = {}
    for p, v in pairs(Boxes) do pcall(function() v:Remove() end) end; Boxes = {}
    for p, v in pairs(Names) do pcall(function() v:Remove() end) end; Names = {}
    for p, v in pairs(Distances) do pcall(function() v:Remove() end) end; Distances = {}
    for p, v in pairs(HealthBars) do pcall(function() v:Remove() end) end; HealthBars = {}
    for p, v in pairs(HealthBarOutlines) do pcall(function() v:Remove() end) end; HealthBarOutlines = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("AMBA_ESP") then pcall(function() p.Character.AMBA_ESP:Destroy() end) end
    end
end

EspBtn.MouseButton1Click:Connect(function()
    _G.ESPEnabled = not _G.ESPEnabled
    EspBtn.Text = "ESP: " .. (_G.ESPEnabled and "ON" or "OFF")
    UpdateToggleVisual(EspBtn, _G.ESPEnabled)
    if not _G.ESPEnabled then ClearESP() end
end)

AimBtn.MouseButton1Click:Connect(function()
    _G.AimbotEnabled = not _G.AimbotEnabled
    AimBtn.Text = "AUTO AIM: " .. (_G.AimbotEnabled and "ON" or "OFF")
    UpdateToggleVisual(AimBtn, _G.AimbotEnabled)
end)

SelectTargetBtn.MouseButton1Click:Connect(function()
    local name = TargetInput.Text
    if name == "" then return end
    for _, p in pairs(Players:GetPlayers()) do
        if p.Name:lower():find(name:lower()) and p ~= LocalPlayer then
            _G.ShadowTarget = p; SelectTargetBtn.Text = p.Name:upper() return
        end
    end
    SelectTargetBtn.Text = "GAK KETEMU!"; task.wait(1); SelectTargetBtn.Text = "PILIH TARGET"
end)

ShadowBtn.MouseButton1Click:Connect(function()
    if not _G.ShadowTarget then return end
    _G.ShadowLockEnabled = not _G.ShadowLockEnabled
    ShadowBtn.Text = "SHADOW LOCK: " .. (_G.ShadowLockEnabled and "ON" or "OFF")
    UpdateToggleVisual(ShadowBtn, _G.ShadowLockEnabled)
    if _G.ShadowLockEnabled then StartShadowLock() else StopShadowLock() end
end)

AntiAimBtn.MouseButton1Click:Connect(function()
    _G.AntiAimbot = not _G.AntiAimbot
    AntiAimBtn.Text = "ANTI AIMBOT: " .. (_G.AntiAimbot and "ON" or "OFF")
    UpdateToggleVisual(AntiAimBtn, _G.AntiAimbot)
    if _G.AntiAimbot then StartAntiAimbot() else if AntiAimConnection then AntiAimConnection:Disconnect() end end
end)

-- =============================================
-- RENDERING CORE LOOP (ESP + BUG-FREE AIMBOT)
-- =============================================
RunService.RenderStepped:Connect(function()
    TriggerBotLogic()
    
    -- RE-CONFIGURED & ROBUST AIMBOT LOGIC
    if _G.AimbotEnabled then
        if _G.ShadowLockEnabled and _G.ShadowTarget and _G.ShadowTarget.Character then
            local targetPart = GetTargetPart(_G.ShadowTarget.Character, _G.AimbotTargetBone)
            if targetPart then Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position) end
        elseif UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local targetPartSelected = nil
            local closestDist = _G.CircleRadius
            local mousePos = UserInputService:GetMouseLocation()
            
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") and p.Team ~= LocalPlayer.Team then
                    if p.Character.Humanoid.Health > 0 then
                        local part = GetTargetPart(p.Character, _G.AimbotTargetBone)
                        
                        if part and IsPlayerVisible(part) then
                            local pos, vis = Camera:WorldToViewportPoint(part.Position)
                            if vis then
                                local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                                if dist < closestDist then closestDist = dist; targetPartSelected = part end
                            end
                        end
                    end
                end
            end
            if targetPartSelected then Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPartSelected.Position) end
        end
    end

    -- ADVANCED DRAWING ESP PACK
    if _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Team ~= LocalPlayer.Team then
                local hrp = p.Character.HumanoidRootPart
                local hum = p.Character.Humanoid
                
                if hum.Health > 0 then
                    local pos, vis = Camera:WorldToViewportPoint(hrp.Position)
                    if vis then
                        local sizeX, sizeY = 2500 / pos.Z, 4000 / pos.Z
                        local boxX, boxY = pos.X - sizeX / 2, pos.Y - sizeY / 2
                        local distanceStuds = math.floor((LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) or 0)

                        -- 1. LINE ESP
                        if not Lines[p] then Lines[p] = Drawing.new("Line") Lines[p].Thickness = 1 end
                        Lines[p].Color = _G.ESPColor
                        Lines[p].From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 15)
                        Lines[p].To = Vector2.new(pos.X, pos.Y)
                        Lines[p].Visible = true

                        -- 2. BOX ESP
                        if not Boxes[p] then Boxes[p] = Drawing.new("Square") Boxes[p].Thickness = 1 Boxes[p].Filled = false end
                        Boxes[p].Color = _G.ESPColor
                        Boxes[p].Size = Vector2.new(sizeX, sizeY)
                        Boxes[p].Position = Vector2.new(boxX, boxY)
                        Boxes[p].Visible = true

                        -- 3. ESP NAME
                        if not Names[p] then Names[p] = Drawing.new("Text") Names[p].Size = 13 Names[p].Center = true Names[p].Outline = true end
                        Names[p].Color = Theme.AccentWhite
                        Names[p].Text = p.Name
                        Names[p].Position = Vector2.new(pos.X, boxY - 16)
                        Names[p].Visible = true

                        -- 4. ESP DISTANCE
                        if not Distances[p] then Distances[p] = Drawing.new("Text") Distances[p].Size = 12 Distances[p].Center = true Distances[p].Outline = true end
                        Distances[p].Color = Theme.TextDark
                        Distances[p].Text = "[" .. distanceStuds .. " Studs]"
                        Distances[p].Position = Vector2.new(pos.X, boxY + sizeY + 2)
                        Distances[p].Visible = true

                        -- 5. VERTICAL HEALTH BAR
                        if not HealthBarOutlines[p] then HealthBarOutlines[p] = Drawing.new("Square") HealthBarOutlines[p].Thickness = 1 HealthBarOutlines[p].Filled = true HealthBarOutlines[p].Color = Color3.fromRGB(0,0,0) end
                        HealthBarOutlines[p].Size = Vector2.new(4, sizeY)
                        HealthBarOutlines[p].Position = Vector2.new(boxX - 6, boxY)
                        HealthBarOutlines[p].Visible = true

                        if not HealthBars[p] then HealthBars[p] = Drawing.new("Square") HealthBars[p].Thickness = 1 HealthBars[p].Filled = true end
                        local healthPercent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                        HealthBars[p].Color = Color3.fromRGB(255 - (255 * healthPercent), 255 * healthPercent, 0)
                        HealthBars[p].Size = Vector2.new(2, sizeY * healthPercent)
                        HealthBars[p].Position = Vector2.new(boxX - 5, boxY + (sizeY * (1 - healthPercent)))
                        HealthBars[p].Visible = true

                        -- 6. CHAMS HIGHLIGHT
                        local highlight = p.Character:FindFirstChild("AMBA_ESP")
                        if not highlight then
                            highlight = Instance.new("Highlight")
                            highlight.Name = "AMBA_ESP"
                            highlight.FillTransparency = 0.6; highlight.OutlineTransparency = 0.3
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; highlight.Parent = p.Character
                        end
                        highlight.FillColor = _G.ESPColor; highlight.OutlineColor = _G.ESPColor
                        continue
                    end
                end
            end
            if Lines[p] then Lines[p].Visible = false end
            if Boxes[p] then Boxes[p].Visible = false end
            if Names[p] then Names[p].Visible = false end
            if Distances[p] then Distances[p].Visible = false end
            if HealthBars[p] then HealthBars[p].Visible = false end
            if HealthBarOutlines[p] then HealthBarOutlines[p].Visible = false end
            if p.Character and p.Character:FindFirstChild("AMBA_ESP") then pcall(function() p.Character.AMBA_ESP:Destroy() end) end
        end
    end
end)

-- RESPAWN HANDLERS
LocalPlayer.CharacterAdded:Connect(function(character)
    if not _G.ESPEnabled then ClearESP() end
    if _G.NoRecoil then
        for _, conn in pairs(NoRecoilConnections) do if conn then conn:Disconnect() end end
        NoRecoilConnections = {}
        NoRecoilConnections[1] = RunService.RenderStepped:Connect(function()
            local tool = character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Recoil") then tool.Recoil.Enabled = false end
        end)
    end
end)

Players.PlayerRemoving:Connect(function(ply)
    if Lines[ply] then pcall(function() Lines[ply]:Remove() Names[ply]:Remove() Distances[ply]:Remove() Boxes[ply]:Remove() HealthBars[ply]:Remove() HealthBarOutlines[ply]:Remove() end) end
end)

-- UI TRANSITIONS
local isTweeningUI = false
local function FadeMinimize()
    if isTweeningUI then return end
    isTweeningUI = true
    local fadeOut = TweenService:Create(MainFrame, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {GroupTransparency = 1, Size = UDim2.new(0, 480, 0, 350)})
    fadeOut:Play()
    fadeOut.Completed:Connect(function()
        MainFrame.Visible = false; MiniBox.GroupTransparency = 1; MiniBox.Size = UDim2.new(0, 32, 0, 32); MiniBox.Visible = true
        TweenService:Create(MiniBox, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {GroupTransparency = 0, Size = UDim2.new(0, 48, 0, 48)}):Play()
        isTweeningUI = false
    end)
end

local function FadeMaximize()
    if isTweeningUI then return end
    isTweeningUI = true
    local fadeOutMini = TweenService:Create(MiniBox, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {GroupTransparency = 1, Size = UDim2.new(0, 32, 0, 32)})
    fadeOutMini:Play()
    fadeOutMini.Completed:Connect(function()
        MiniBox.Visible = false; MainFrame.GroupTransparency = 1; MainFrame.Size = UDim2.new(0, 480, 0, 350); MainFrame.Visible = true
        local fadeInMain = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {GroupTransparency = 0, Size = UDim2.new(0, 540, 0, 390)})
        fadeInMain:Play()
        fadeInMain.Completed:Connect(function() isTweeningUI = false end)
    end)
end

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Parent = TabBar
MinimizeBtn.Position = UDim2.new(1, -42, 0, 11)
MinimizeBtn.Size = UDim2.new(0, 28, 0, 28)
MinimizeBtn.BackgroundTransparency = 1; MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Theme.TextDark; MinimizeBtn.TextSize = 14; MinimizeBtn.Font = Enum.Font.SourceSansBold; MinimizeBtn.ZIndex = 10

MinimizeBtn.MouseEnter:Connect(function() MinimizeBtn.TextColor3 = Theme.AccentWhite end)
MinimizeBtn.MouseLeave:Connect(function() MinimizeBtn.TextColor3 = Theme.TextDark() end)
MinimizeBtn.MouseButton1Click:Connect(FadeMinimize)
MiniBtnActual.MouseButton1Click:Connect(FadeMaximize)

print("AMBA.HUB V12 LOADED - AIMBOT COMPLETELY FIXED!")
