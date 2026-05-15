-- AMBA.HUB - Pinguin Supreme --
-- VERSION 4: COMPLETE FIX + SHADOW LOCK + ANTI-AIMBOT --
-- Fixed by: VOID 🕳️ --

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
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

-- DATABASE
local OriginalMaterials = {}
local Lines = {}
local NoRecoilConnections = {}
local lastShot = 0
local ShadowConnection = nil
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
local FpsBtn = CreateActionBtn(BoostPage, "FPS BOOST: OFF", UDim2.new(0.5, -110, 0.1, 0))
local PingBtn = CreateActionBtn(BoostPage, "PING OPTIMIZER: OFF", UDim2.new(0.5, -110, 0.3, 0))

-- INFO TAB CONTENT
local InfoTitle = Instance.new("TextLabel")
InfoTitle.Parent = InfoPage
InfoTitle.Position = UDim2.new(0.05, 0, 0.02, 0)
InfoTitle.Size = UDim2.new(0.9, 0, 0.35, 0)
InfoTitle.BackgroundTransparency = 1
InfoTitle.Text = "SCRIPT BY PINGUIN\nINDONESIAN PROGRAMMER\n\nPLEASE JOIN OUR DISCORD\nFOR MORE SCRIPTS AND UPDATES!\n\nSTAY AMBARUL!!!"
InfoTitle.TextColor3 = Color3.new(1, 1, 1)
InfoTitle.TextSize = 15
InfoTitle.Font = Enum.Font.SourceSansBold
InfoTitle.TextWrapped = true
InfoTitle.TextYAlignment = Enum.TextYAlignment.Top
InfoTitle.ZIndex = 7

-- DISCORD BUTTON
local DiscordBtn = Instance.new("TextButton")
DiscordBtn.Parent = InfoPage
DiscordBtn.Position = UDim2.new(0.5, -110, 0.55, 0)
DiscordBtn.Size = UDim2.new(0, 220, 0, 45)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordBtn.BorderSizePixel = 1
DiscordBtn.BorderColor3 = Color3.new(1, 1, 1)
DiscordBtn.Text = "JOIN DISCORD"
DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
DiscordBtn.TextSize = 16
DiscordBtn.Font = Enum.Font.SourceSansBold
DiscordBtn.ZIndex = 7

DiscordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/qa5bpScJ5a")
        DiscordBtn.Text = "LINK COPIED!"
        task.wait(2)
        DiscordBtn.Text = "JOIN DISCORD"
    end
end)

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

-- =============================================
-- ANTI REPORT (FIXED)
-- =============================================
ProtectBtn.MouseButton1Click:Connect(function()
    _G.AntiReport = not _G.AntiReport
    ProtectBtn.Text = "ANTI-REPORT: " .. (_G.AntiReport and "ON" or "OFF")
end)

local function OnChat(ply, msg)
    if _G.AntiReport and ply ~= LocalPlayer then
        local lowerMsg = msg:lower()
        if lowerMsg:find("report") or lowerMsg:find("cheat") or lowerMsg:find("hacker") then
            LocalPlayer:Kick("Anti-Report: Potential threat detected in chat.")
        end
    end
end
for _, ply in pairs(Players:GetPlayers()) do 
    ply.Chatted:Connect(function(msg) OnChat(ply, msg) end) 
end
Players.PlayerAdded:Connect(function(ply) 
    ply.Chatted:Connect(function(msg) OnChat(ply, msg) end) 
end)

-- =============================================
-- NO RECOIL (FIXED)
-- =============================================
RecoilBtn.MouseButton1Click:Connect(function()
    _G.NoRecoil = not _G.NoRecoil
    RecoilBtn.Text = "NO RECOIL: " .. (_G.NoRecoil and "ON" or "OFF")
    
    if _G.NoRecoil then
        NoRecoilConnections[1] = RunService.RenderStepped:Connect(function()
            local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
                pcall(function()
                    if tool:FindFirstChild("Recoil") then
                        tool.Recoil.Enabled = false
                    end
                end)
            end
        end)
        NoRecoilConnections[2] = RunService.Heartbeat:Connect(function()
            pcall(function()
                if Camera then Camera.FieldOfView = 70 end
            end)
        end)
    else
        for _, conn in pairs(NoRecoilConnections) do
            if conn then conn:Disconnect() end
        end
        NoRecoilConnections = {}
        pcall(function() Camera.FieldOfView = 70 end)
    end
end)

-- =============================================
-- TRIGGER BOT (FIXED)
-- =============================================
TrigBtn.MouseButton1Click:Connect(function()
    _G.TriggerBot = not _G.TriggerBot
    TrigBtn.Text = "TRIGGER BOT: " .. (_G.TriggerBot and "ON" or "OFF")
end)

local function TriggerBotLogic()
    if not _G.TriggerBot then return end
    
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Team ~= LocalPlayer.Team then
            local humanoid = p.Character.Humanoid
            if humanoid.Health <= 0 then continue end
            
            local head = p.Character.Head
            local pos, vis = Camera:WorldToViewportPoint(head.Position)
            
            if vis then
                local distance = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                
                if distance <= 80 then
                    if tick() - lastShot >= _G.TriggerBotDelay then
                        VirtualInputManager:SendMouseButtonEvent(
                            Camera.ViewportSize.X / 2,
                            Camera.ViewportSize.Y / 2,
                            0,
                            true,
                            game,
                            0
                        )
                        task.wait(0.05)
                        VirtualInputManager:SendMouseButtonEvent(
                            Camera.ViewportSize.X / 2,
                            Camera.ViewportSize.Y / 2,
                            0,
                            false,
                            game,
                            0
                        )
                        lastShot = tick()
                    end
                    break
                end
            end
        end
    end
end

-- =============================================
-- FPS BOOST (FIXED WITH RESTORE)
-- =============================================
FpsBtn.MouseButton1Click:Connect(function()
    _G.FpsBoostActive = not _G.FpsBoostActive
    local LoadingLabel = Instance.new("TextLabel")
    LoadingLabel.Parent = MainFrame
    LoadingLabel.Size = UDim2.new(1, 0, 1, 0)
    LoadingLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LoadingLabel.BackgroundTransparency = 0.2
    LoadingLabel.Text = _G.FpsBoostActive and "ENABLING FPS BOOST..." or "RESTORING GRAPHICS..."
    LoadingLabel.TextColor3 = Color3.new(1, 1, 1)
    LoadingLabel.TextSize = 25
    LoadingLabel.Font = Enum.Font.SourceSansBold
    LoadingLabel.ZIndex = 50
    
    FpsBtn.Text = "PROCESSING..."
    task.wait(0.1)
    
    if _G.FpsBoostActive then
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("BasePart") then
                OriginalMaterials[v] = {Material = v.Material, Reflectance = v.Reflectance}
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                OriginalMaterials[v] = {Transparency = v.Transparency}
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                OriginalMaterials[v] = {Enabled = v.Enabled}
                v.Enabled = false
            end
        end
        Lighting.GlobalShadows = false
        pcall(function() settings().Rendering.QualityLevel = 1 end)
        FpsBtn.Text = "FPS BOOST: ACTIVE"
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
        pcall(function() settings().Rendering.QualityLevel = 7 end)
        OriginalMaterials = {}
        FpsBtn.Text = "FPS BOOST: OFF"
    end
    
    LoadingLabel:Destroy()
end)

-- =============================================
-- PING OPTIMIZER (FIXED - NO MORE -1000)
-- =============================================
PingBtn.MouseButton1Click:Connect(function()
    _G.PingOptimizer = not _G.PingOptimizer
    PingBtn.Text = "PING OPTIMIZER: " .. (_G.PingOptimizer and "ON" or "OFF")
    
    if _G.PingOptimizer then
        pcall(function()
            settings():GetService("NetworkSettings").IncomingReplicationLag = 0.05
            settings():GetService("NetworkSettings").DataSendRate = 120
            settings():GetService("NetworkSettings").DataReceiveRate = 120
        end)
        
        PingOptimizerConnection = RunService.Heartbeat:Connect(function()
            if tick() - lastPingOptimize < PingOptimizeCooldown then return end
            lastPingOptimize = tick()
            
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local rootPos = char.HumanoidRootPart.Position
            
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj:CanSetNetworkOwnership() then
                    local distance = (obj.Position - rootPos).Magnitude
                    if distance <= 150 then
                        pcall(function()
                            obj:SetNetworkOwner(LocalPlayer)
                        end)
                    end
                end
            end
        end)
        print("[PING OPTIMIZER] Activated")
    else
        if PingOptimizerConnection then
            PingOptimizerConnection:Disconnect()
            PingOptimizerConnection = nil
        end
        
        pcall(function()
            settings():GetService("NetworkSettings").IncomingReplicationLag = 0.1
            settings():GetService("NetworkSettings").DataSendRate = 60
            settings():GetService("NetworkSettings").DataReceiveRate = 60
        end)
        print("[PING OPTIMIZER] Deactivated")
    end
end)

-- =============================================
-- SHADOW LOCK SYSTEM (NEW)
-- =============================================
function StartShadowLock()
    if ShadowConnection then ShadowConnection:Disconnect() end
    
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.PlatformStand = true
            hum.AutoRotate = false
        end
    end
    
    ShadowConnection = RunService.RenderStepped:Connect(function()
        if not _G.ShadowLockEnabled or not _G.ShadowTarget then
            StopShadowLock()
            return
        end
        
        local myChar = LocalPlayer.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end
        
        local targetChar = _G.ShadowTarget.Character
        if not targetChar then
            StopShadowLock()
            return
        end
        
        local targetHead = targetChar:FindFirstChild("Head")
        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetHead and not targetRoot then
            StopShadowLock()
            return
        end
        
        local tp = targetHead and targetHead.Position or targetRoot.Position
        local rx = math.sin(tick() * 5) * 2
        local ry = math.cos(tick() * 7) * 1.5 + 3
        local rz = math.cos(tick() * 6) * 2
        
        local targetPos = tp + Vector3.new(rx, ry, rz)
        myHRP.Velocity = (targetPos - myHRP.Position) * 10
        myHRP.CFrame = CFrame.new(myHRP.Position, tp)
    end)
end

function StopShadowLock()
    _G.ShadowLockEnabled = false
    if ShadowConnection then
        ShadowConnection:Disconnect()
        ShadowConnection = nil
    end
    
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.PlatformStand = false
            hum.AutoRotate = true
        end
    end
end

-- =============================================
-- ANTI-AIMBOT SYSTEM (NEW)
-- =============================================
function StartAntiAimbot()
    if AntiAimConnection then AntiAimConnection:Disconnect() end
    
    AntiAimConnection = RunService.RenderStepped:Connect(function()
        if not _G.AntiAimbot then return end
        
        local char = LocalPlayer.Character
        if not char then return end
        
        local head = char:FindFirstChild("Head")
        if head then
            head.CFrame = head.CFrame * CFrame.new(
                math.sin(tick() * 25) * 1,
                math.cos(tick() * 20) * 1,
                math.sin(tick() * 22) * 0.5
            )
        end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(8), math.rad(3))
        end
        
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                pcall(function()
                    part.CFrame = part.CFrame * CFrame.new(
                        math.sin(tick() * 30) * 0.3,
                        math.cos(tick() * 28) * 0.3,
                        0
                    )
                end)
            end
        end
    end)
    
    task.spawn(function()
        while _G.AntiAimbot do
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") and part:CanSetNetworkOwnership() then
                        pcall(function() part:SetNetworkOwner(nil) end)
                    end
                end
            end
            task.wait(0.3)
        end
    end)
end

function StopAntiAimbot()
    if AntiAimConnection then
        AntiAimConnection:Disconnect()
        AntiAimConnection = nil
    end
end

-- =============================================
-- CHAT COMMANDS (ALL IN ONE)
-- =============================================
LocalPlayer.Chatted:Connect(function(msg)
    local lowerMsg = msg:lower()
    
    -- Shadow Lock
    if lowerMsg:find("/shadow ") then
        local targetName = msg:sub(9)
        for _, p in pairs(Players:GetPlayers()) do
            if p.Name:lower():find(targetName:lower()) and p ~= LocalPlayer then
                if p.Team ~= LocalPlayer.Team or not p.Team then
                    _G.ShadowTarget = p
                    _G.ShadowLockEnabled = true
                    StartShadowLock()
                    print("[SHADOW LOCK] Nempel ke: " .. p.Name)
                else
                    print("[SHADOW LOCK] Gak bisa lock temen!")
                end
                return
            end
        end
        print("[SHADOW LOCK] Target gak ditemukan!")
        
    elseif lowerMsg == "/unshadow" then
        _G.ShadowTarget = nil
        StopShadowLock()
        print("[SHADOW LOCK] Mati")
    
    -- Toggle Shadow Lock (tanpa target baru)
    elseif lowerMsg == "/shadowlock" then
        if not _G.ShadowTarget then
            print("[SHADOW LOCK] Pilih target dulu: /shadow [nama]")
            return
        end
        _G.ShadowLockEnabled = not _G.ShadowLockEnabled
        if _G.ShadowLockEnabled then
            StartShadowLock()
            print("[SHADOW LOCK] NYALA")
        else
            StopShadowLock()
            print("[SHADOW LOCK] MATI")
        end
    
    -- Anti-Aimbot
    elseif lowerMsg == "/antiaim" then
        _G.AntiAimbot = not _G.AntiAimbot
        if _G.AntiAimbot then
            StartAntiAimbot()
            print("[ANTI-AIMBOT] NYALA - Badan lu susah di-lock")
        else
            StopAntiAimbot()
            print("[ANTI-AIMBOT] MATI")
        end
    end
end)

-- =============================================
-- ESP SYSTEM (FIXED)
-- =============================================
local function ClearESP()
    for ply, line in pairs(Lines) do
        if line then
            line.Visible = false
            line:Remove()
        end
        Lines[ply] = nil
    end
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("AMBA_ESP") then
            p.Character.AMBA_ESP:Destroy()
        end
    end
end

EspBtn.MouseButton1Click:Connect(function()
    _G.ESPEnabled = not _G.ESPEnabled
    EspBtn.Text = "ESP: " .. (_G.ESPEnabled and "ON" or "OFF")
    if not _G.ESPEnabled then ClearESP() end
end)

-- =============================================
-- AIMBOT LOGIC (FIXED + TEAM CHECK)
-- =============================================
AimBtn.MouseButton1Click:Connect(function()
    _G.AimbotEnabled = not _G.AimbotEnabled
    AimBtn.Text = "AUTO AIM: " .. (_G.AimbotEnabled and "ON" or "OFF")
end)

-- =============================================
-- COMBAT & VISUAL RUNNER
-- =============================================
RunService.RenderStepped:Connect(function()
    -- TRIGGER BOT
    TriggerBotLogic()
    
    -- AIMBOT
    if _G.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = nil
        local closestDist = _G.CircleRadius
        local mousePos = UserInputService:GetMouseLocation()
        
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Team ~= LocalPlayer.Team then
                if p.Character.Humanoid.Health > 0 then
                    local pos, vis = Camera:WorldToViewportPoint(p.Character.Head.Position)
                    if vis then
                        local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            target = p.Character.Head
                        end
                    end
                end
            end
        end
        if target then 
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position) 
        end
    end

    -- ESP
    if _G.ESPEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
                if p.Character.Humanoid.Health > 0 then
                    if not p.Character:FindFirstChild("AMBA_ESP") then
                        local h = Instance.new("Highlight", p.Character)
                        h.Name = "AMBA_ESP"
                        h.FillColor = Color3.new(1, 0, 0)
                        h.FillTransparency = 0.3
                    end
                    
                    local pos, vis = Camera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                    if vis then
                        if not Lines[p] then 
                            Lines[p] = Drawing.new("Line")
                            Lines[p].Thickness = 1
                            Lines[p].Color = Color3.new(1, 0, 0)
                        end
                        if Lines[p] then
                            Lines[p].From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                            Lines[p].To = Vector2.new(pos.X, pos.Y)
                            Lines[p].Visible = true
                        end
                    else
                        if Lines[p] then 
                            Lines[p].Visible = false 
                        end
                    end
                else
                    if Lines[p] then 
                        Lines[p].Visible = false 
                    end
                    if p.Character:FindFirstChild("AMBA_ESP") then
                        p.Character.AMBA_ESP:Destroy()
                    end
                end
            end
        end
    end
end)

-- =============================================
-- RESPAWN HANDLER
-- =============================================
LocalPlayer.CharacterAdded:Connect(function(character)
    if not _G.ESPEnabled then ClearESP() end
    
    if _G.NoRecoil then
        for _, conn in pairs(NoRecoilConnections) do
            if conn then conn:Disconnect() end
        end
        NoRecoilConnections = {}
        
        NoRecoilConnections[1] = RunService.RenderStepped:Connect(function()
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then
                pcall(function()
                    if tool:FindFirstChild("Recoil") then
                        tool.Recoil.Enabled = false
                    end
                end)
            end
        end)
    end
    
    if _G.ShadowLockEnabled and _G.ShadowTarget then
        task.wait(0.3)
        StartShadowLock()
    end
    
    if _G.AntiAimbot then
        StartAntiAimbot()
    end
end)

Players.PlayerRemoving:Connect(function(ply)
    if ply == _G.ShadowTarget then
        _G.ShadowTarget = nil
        StopShadowLock()
        print("[SHADOW LOCK] Target left")
    end
end)

-- =============================================
-- ADDON: SHADOW LOCK + ANTI-AIMBOT (DENGAN INPUT USERNAME)
-- Tempel di paling bawah script V4 lu
-- Ada textbox buat ngetik nama target!
-- =============================================

-- SETTINGS
_G.ShadowLockEnabled = false
_G.ShadowTarget = nil
_G.AntiAimbot = false

-- VARIABLES
local ShadowConnection = nil
local AntiAimConnection = nil

-- =============================================
-- TEXTBOX BUAT INPUT NAMA TARGET
-- =============================================
local TargetInput = Instance.new("TextBox")
TargetInput.Parent = MainPage
TargetInput.Position = UDim2.new(0.05, 0, 0.62, 0)
TargetInput.Size = UDim2.new(0, 220, 0, 35)
TargetInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TargetInput.BorderSizePixel = 1
TargetInput.BorderColor3 = Color3.new(1, 1, 1)
TargetInput.PlaceholderText = "Masukkan nama target..."
TargetInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
TargetInput.Text = ""
TargetInput.TextColor3 = Color3.new(1, 1, 1)
TargetInput.TextSize = 14
TargetInput.Font = Enum.Font.SourceSans
TargetInput.ZIndex = 7

-- =============================================
-- TOMBOL PILIH TARGET
-- =============================================
local SelectTargetBtn = CreateActionBtn(MainPage, "PILIH TARGET", UDim2.new(0.55, 0, 0.62, 0))
SelectTargetBtn.Size = UDim2.new(0, 100, 0, 35)

SelectTargetBtn.MouseButton1Click:Connect(function()
    local targetName = TargetInput.Text
    if targetName == "" then
        SelectTargetBtn.Text = "ISI DULU!"
        task.wait(1)
        SelectTargetBtn.Text = "PILIH TARGET"
        return
    end
    
    local found = false
    for _, p in pairs(Players:GetPlayers()) do
        if p.Name:lower():find(targetName:lower()) and p ~= LocalPlayer then
            _G.ShadowTarget = p
            SelectTargetBtn.Text = "TARGET: " .. p.Name
            print("[SHADOW LOCK] Target dipilih: " .. p.Name)
            found = true
            break
        end
    end
    
    if not found then
        SelectTargetBtn.Text = "GAK KETEMU!"
        task.wait(1)
        SelectTargetBtn.Text = "PILIH TARGET"
        print("[SHADOW LOCK] Target tidak ditemukan!")
    end
end)

-- =============================================
-- TOMBOL SHADOW LOCK ON/OFF
-- =============================================
local ShadowBtn = CreateActionBtn(MainPage, "SHADOW LOCK: OFF", UDim2.new(0.05, 0, 0.73, 0))

ShadowBtn.MouseButton1Click:Connect(function()
    if not _G.ShadowTarget then
        ShadowBtn.Text = "PILIH TARGET DULU!"
        task.wait(1.5)
        ShadowBtn.Text = "SHADOW LOCK: OFF"
        return
    end
    
    _G.ShadowLockEnabled = not _G.ShadowLockEnabled
    ShadowBtn.Text = "SHADOW LOCK: " .. (_G.ShadowLockEnabled and "ON" or "OFF")
    
    if _G.ShadowLockEnabled then
        StartShadowLock()
    else
        StopShadowLock()
    end
end)

-- =============================================
-- TOMBOL ANTI-AIMBOT
-- =============================================
local AntiAimBtn = CreateActionBtn(MainPage, "ANTI AIMBOT: OFF", UDim2.new(0.55, 0, 0.73, 0))

AntiAimBtn.MouseButton1Click:Connect(function()
    _G.AntiAimbot = not _G.AntiAimbot
    AntiAimBtn.Text = "ANTI AIMBOT: " .. (_G.AntiAimbot and "ON" or "OFF")
    
    if _G.AntiAimbot then
        StartAntiAimbot()
    else
        StopAntiAimbot()
    end
end)

-- =============================================
-- SHADOW LOCK (TERBANG NEMPEL MUSUH)
-- =============================================
function StartShadowLock()
    if ShadowConnection then ShadowConnection:Disconnect() end
    
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.PlatformStand = true
            hum.AutoRotate = false
        end
    end
    
    ShadowConnection = RunService.RenderStepped:Connect(function()
        if not _G.ShadowLockEnabled or not _G.ShadowTarget then
            StopShadowLock()
            return
        end
        
        local myChar = LocalPlayer.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end
        
        local targetChar = _G.ShadowTarget.Character
        if not targetChar then
            StopShadowLock()
            return
        end
        
        local targetHead = targetChar:FindFirstChild("Head")
        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetHead and not targetRoot then
            StopShadowLock()
            return
        end
        
        local tp = targetHead and targetHead.Position or targetRoot.Position
        local rx = math.sin(tick() * 5) * 2
        local ry = math.cos(tick() * 7) * 1.5 + 3
        local rz = math.cos(tick() * 6) * 2
        
        local targetPos = tp + Vector3.new(rx, ry, rz)
        myHRP.Velocity = (targetPos - myHRP.Position) * 10
        myHRP.CFrame = CFrame.new(myHRP.Position, tp)
    end)
end

function StopShadowLock()
    _G.ShadowLockEnabled = false
    ShadowBtn.Text = "SHADOW LOCK: OFF"
    if ShadowConnection then
        ShadowConnection:Disconnect()
        ShadowConnection = nil
    end
    
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.PlatformStand = false
            hum.AutoRotate = true
        end
    end
end

-- =============================================
-- ANTI-AIMBOT (BADAN GAK BISA DI-LOCK HACKER)
-- =============================================
function StartAntiAimbot()
    if AntiAimConnection then AntiAimConnection:Disconnect() end
    
    AntiAimConnection = RunService.RenderStepped:Connect(function()
        if not _G.AntiAimbot then return end
        
        local char = LocalPlayer.Character
        if not char then return end
        
        local head = char:FindFirstChild("Head")
        if head then
            head.CFrame = head.CFrame * CFrame.new(
                math.sin(tick() * 25) * 1,
                math.cos(tick() * 20) * 1,
                math.sin(tick() * 22) * 0.5
            )
        end
        
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(8), math.rad(3))
        end
        
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                pcall(function()
                    part.CFrame = part.CFrame * CFrame.new(
                        math.sin(tick() * 30) * 0.3,
                        math.cos(tick() * 28) * 0.3,
                        0
                    )
                end)
            end
        end
    end)
    
    task.spawn(function()
        while _G.AntiAimbot do
            local char = LocalPlayer.Character
            if char then
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") and part:CanSetNetworkOwnership() then
                        pcall(function() part:SetNetworkOwner(nil) end)
                    end
                end
            end
            task.wait(0.3)
        end
    end)
end

function StopAntiAimbot()
    if AntiAimConnection then
        AntiAimConnection:Disconnect()
        AntiAimConnection = nil
    end
end

-- =============================================
-- CHAT COMMANDS (BONUS)
-- =============================================
LocalPlayer.Chatted:Connect(function(msg)
    local lowerMsg = msg:lower()
    
    if lowerMsg:find("/shadow ") then
        local targetName = msg:sub(9)
        TargetInput.Text = targetName
        for _, p in pairs(Players:GetPlayers()) do
            if p.Name:lower():find(targetName:lower()) and p ~= LocalPlayer then
                _G.ShadowTarget = p
                SelectTargetBtn.Text = "TARGET: " .. p.Name
                print("[SHADOW LOCK] Target: " .. p.Name)
                return
            end
        end
        print("[SHADOW LOCK] Target gak ditemukan!")
        
    elseif lowerMsg == "/unshadow" then
        _G.ShadowTarget = nil
        TargetInput.Text = ""
        SelectTargetBtn.Text = "PILIH TARGET"
        StopShadowLock()
        print("[SHADOW LOCK] Mati")
    
    elseif lowerMsg == "/antiaim" then
        _G.AntiAimbot = not _G.AntiAimbot
        AntiAimBtn.Text = "ANTI AIMBOT: " .. (_G.AntiAimbot and "ON" or "OFF")
        if _G.AntiAimbot then StartAntiAimbot() else StopAntiAimbot() end
    end
end)

-- =============================================
-- RESPAWN HANDLER
-- =============================================
LocalPlayer.CharacterAdded:Connect(function(character)
    if _G.ShadowLockEnabled and _G.ShadowTarget then
        task.wait(0.3)
        StartShadowLock()
    end
    
    if _G.AntiAimbot then
        StartAntiAimbot()
    end
end)

Players.PlayerRemoving:Connect(function(ply)
    if ply == _G.ShadowTarget then
        _G.ShadowTarget = nil
        TargetInput.Text = ""
        SelectTargetBtn.Text = "PILIH TARGET"
        StopShadowLock()
        print("[SHADOW LOCK] Target left")
    end
end)

print("[ADDON] Shadow Lock & Anti-Aimbot loaded!")
print("[ADDON] Ketik nama target di textbox, klik PILIH TARGET, lalu klik SHADOW LOCK")
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

print("AMBA.HUB V4 FULLY FIXED + SHADOW LOCK + ANTI-AIMBOT!")
print("Chat commands: /shadow [nama], /unshadow, /shadowlock, /antiaim")
print("Aimbot & TriggerBot now ignore teammates!")
