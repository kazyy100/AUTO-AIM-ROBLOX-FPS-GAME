-- AMBA.HUB - Pinguin Supreme --
-- VERSION 20 (AIMBOT FINAL FIXED: NO AUTO-SWITCH, LOCK UNTIL DEATH)
-- MODIFIED BY BEXUS: ADDED TEAM TARGET FEATURE (CLEANED BY GEMINI)
-- =============================================
-- KEY SYSTEM
-- =============================================
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local KEY_URL = "https://gist.githubusercontent.com/kazyy100/f2d9a17322e3f58300e8d50cac20c6d5/raw/475382cc1e066589e928e32e03e005970ea90413/gistfile1.txt"

local function FetchValidKeys()
    local success, result = pcall(function()
        return game:HttpGet(KEY_URL)
    end)
    if success and result then
        local keys = {}
        for line in result:gmatch("[^\r\n]+") do
            local trimmed = line:match("^%s*(.-)%s*$")
            if trimmed ~= "" then
                keys[trimmed] = true
            end
        end
        return keys
    end
    return nil
end

local function CreateKeyUI()
    if game:GetService("CoreGui"):FindFirstChild("AMBA_KEY_UI") then
        game:GetService("CoreGui")["AMBA_KEY_UI"]:Destroy()
    end

    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Name = "AMBA_KEY_UI"
    KeyGui.Parent = game:GetService("CoreGui")
    KeyGui.ResetOnSpawn = false
    KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Overlay = Instance.new("Frame")
    Overlay.Parent = KeyGui
    Overlay.Size = UDim2.new(1, 0, 1, 0)
    Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Overlay.BackgroundTransparency = 0.4
    Overlay.ZIndex = 1

    local KeyFrame = Instance.new("Frame")
    KeyFrame.Parent = KeyGui
    KeyFrame.Size = UDim2.new(0, 420, 0, 290)
    KeyFrame.Position = UDim2.new(0.5, -210, 0.5, -145)
    KeyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    KeyFrame.BorderSizePixel = 0
    KeyFrame.ZIndex = 2
    Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

    local KeyStroke = Instance.new("UIStroke")
    KeyStroke.Parent = KeyFrame
    KeyStroke.Color = Color3.fromRGB(60, 60, 60)
    KeyStroke.Thickness = 1.5

    local TopBar = Instance.new("Frame")
    TopBar.Parent = KeyFrame
    TopBar.Size = UDim2.new(1, 0, 0, 48)
    TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    TopBar.BorderSizePixel = 0
    TopBar.ZIndex = 3
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

    local Patch = Instance.new("Frame")
    Patch.Parent = TopBar
    Patch.Size = UDim2.new(1, 0, 0.4, 0)
    Patch.Position = UDim2.new(0, 0, 0.6, 0)
    Patch.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Patch.BorderSizePixel = 0
    Patch.ZIndex = 3

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TopBar
    TitleLabel.Size = UDim2.new(1, 0, 1, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "  AMBA.HUB  //  KEY SYSTEM"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 4

    local SubLabel = Instance.new("TextLabel")
    SubLabel.Parent = KeyFrame
    SubLabel.Position = UDim2.new(0, 20, 0, 58)
    SubLabel.Size = UDim2.new(1, -40, 0, 20)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = "Masukkan key untuk mengakses AMBA.HUB"
    SubLabel.TextColor3 = Color3.fromRGB(130, 130, 130)
    SubLabel.TextSize = 13
    SubLabel.Font = Enum.Font.SourceSans
    SubLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubLabel.ZIndex = 3

    local InputBox = Instance.new("TextBox")
    InputBox.Parent = KeyFrame
    InputBox.Position = UDim2.new(0, 20, 0, 90)
    InputBox.Size = UDim2.new(1, -40, 0, 42)
    InputBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    InputBox.BorderSizePixel = 0
    InputBox.PlaceholderText = "Masukkan key kamu di sini..."
    InputBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
    InputBox.Text = ""
    InputBox.TextColor3 = Color3.fromRGB(240, 240, 240)
    InputBox.TextSize = 14
    InputBox.Font = Enum.Font.SourceSansBold
    InputBox.ClearTextOnFocus = false
    InputBox.ZIndex = 3
    Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 8)

    local InputStroke = Instance.new("UIStroke")
    InputStroke.Parent = InputBox
    InputStroke.Color = Color3.fromRGB(50, 50, 50)
    InputStroke.Thickness = 1

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Parent = KeyFrame
    StatusLabel.Position = UDim2.new(0, 20, 0, 140)
    StatusLabel.Size = UDim2.new(1, -40, 0, 20)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = ""
    StatusLabel.TextColor3 = Color3.fromRGB(200, 80, 80)
    StatusLabel.TextSize = 13
    StatusLabel.Font = Enum.Font.SourceSans
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
    StatusLabel.ZIndex = 3

    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Parent = KeyFrame
    SubmitBtn.Position = UDim2.new(0, 20, 0, 170)
    SubmitBtn.Size = UDim2.new(1, -40, 0, 44)
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SubmitBtn.BorderSizePixel = 0
    SubmitBtn.Text = "SUBMIT KEY"
    SubmitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    SubmitBtn.TextSize = 15
    SubmitBtn.Font = Enum.Font.SourceSansBold
    SubmitBtn.ZIndex = 3
    Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

    SubmitBtn.MouseEnter:Connect(function()
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    end)
    SubmitBtn.MouseLeave:Connect(function()
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    end)

    -- Tombol 1: SafeLink Asli
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Parent = KeyFrame
    GetKeyBtn.Position = UDim2.new(0, 20, 0, 222)
    GetKeyBtn.Size = UDim2.new(0, 120, 0, 36)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    GetKeyBtn.BorderSizePixel = 0
    GetKeyBtn.Text = "🔑 SAFELINK"
    GetKeyBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    GetKeyBtn.TextSize = 12
    GetKeyBtn.Font = Enum.Font.SourceSansBold
    GetKeyBtn.ZIndex = 3
    Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 8)

    local GetKeyStroke = Instance.new("UIStroke")
    GetKeyStroke.Parent = GetKeyBtn
    GetKeyStroke.Color = Color3.fromRGB(60, 60, 60)
    GetKeyStroke.Thickness = 1

    GetKeyBtn.MouseEnter:Connect(function()
        GetKeyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        GetKeyStroke.Color = Color3.fromRGB(120, 120, 120)
    end)
    GetKeyBtn.MouseLeave:Connect(function()
        GetKeyBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        GetKeyBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        GetKeyStroke.Color = Color3.fromRGB(60, 60, 60)
    end)
    GetKeyBtn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard("https://sfl.gl/ISXiCFTJ") end)
        pcall(function() game:GetService("GuiService"):OpenBrowserWindow("https://sfl.gl/ISXiCFTJ") end)
        GetKeyBtn.Text = "✔ Disalin!"
        GetKeyBtn.TextColor3 = Color3.fromRGB(80, 220, 80)
        task.wait(2.5)
        GetKeyBtn.Text = "🔑 SAFELINK"
        GetKeyBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end)

    -- Tombol 2: Loot Labs
    local LootBtn = Instance.new("TextButton")
    LootBtn.Parent = KeyFrame
    LootBtn.Position = UDim2.new(0, 150, 0, 222)
    LootBtn.Size = UDim2.new(0, 120, 0, 36)
    LootBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    LootBtn.BorderSizePixel = 0
    LootBtn.Text = "💎 LOOT LABS"
    LootBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    LootBtn.TextSize = 12
    LootBtn.Font = Enum.Font.SourceSansBold
    LootBtn.ZIndex = 3
    Instance.new("UICorner", LootBtn).CornerRadius = UDim.new(0, 8)

    local LootStroke = Instance.new("UIStroke")
    LootStroke.Parent = LootBtn
    LootStroke.Color = Color3.fromRGB(60, 60, 60)
    LootStroke.Thickness = 1

    LootBtn.MouseEnter:Connect(function()
        LootBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        LootBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        LootStroke.Color = Color3.fromRGB(120, 120, 120)
    end)
    LootBtn.MouseLeave:Connect(function()
        LootBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        LootBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        LootStroke.Color = Color3.fromRGB(60, 60, 60)
    end)
    LootBtn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard("https://lootdest.org/s?zzHB6pGp") end)
        pcall(function() game:GetService("GuiService"):OpenBrowserWindow("https://lootdest.org/s?zzHB6pGp") end)
        LootBtn.Text = "✔ Disalin!"
        LootBtn.TextColor3 = Color3.fromRGB(80, 220, 80)
        task.wait(2.5)
        LootBtn.Text = "💎 LOOT LABS"
        LootBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end)

    -- Tombol 3: Linkvertise Baru
    local LinkBtn = Instance.new("TextButton")
    LinkBtn.Parent = KeyFrame
    LinkBtn.Position = UDim2.new(0, 280, 0, 222)
    LinkBtn.Size = UDim2.new(0, 120, 0, 36)
    LinkBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    LinkBtn.BorderSizePixel = 0
    LinkBtn.Text = "🌐 LINKVERTISE"
    LinkBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    LinkBtn.TextSize = 12
    LinkBtn.Font = Enum.Font.SourceSansBold
    LinkBtn.ZIndex = 3
    Instance.new("UICorner", LinkBtn).CornerRadius = UDim.new(0, 8)

    local LinkStroke = Instance.new("UIStroke")
    LinkStroke.Parent = LinkBtn
    LinkStroke.Color = Color3.fromRGB(60, 60, 60)
    LinkStroke.Thickness = 1

    LinkBtn.MouseEnter:Connect(function()
        LinkBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        LinkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        LinkStroke.Color = Color3.fromRGB(120, 120, 120)
    end)
    LinkBtn.MouseLeave:Connect(function()
        LinkBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        LinkBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
        LinkStroke.Color = Color3.fromRGB(60, 60, 60)
    end)
    LinkBtn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard("https://link-center.net/6128129/vyp4jy3TMThD") end)
        pcall(function() game:GetService("GuiService"):OpenBrowserWindow("https://link-center.net/6128129/vyp4jy3TMThD") end)
        LinkBtn.Text = "✔ Disalin!"
        LinkBtn.TextColor3 = Color3.fromRGB(80, 220, 80)
        task.wait(2.5)
        LinkBtn.Text = "🌐 LINKVERTISE"
        LinkBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    end)

    return KeyGui, InputBox, SubmitBtn, StatusLabel
end

local function RunKeySystem(onSuccess)
    local KeyGui, InputBox, SubmitBtn, StatusLabel = CreateKeyUI()

    SubmitBtn.MouseButton1Click:Connect(function()
        local enteredKey = InputBox.Text:match("^%s*(.-)%s*$")

        if enteredKey == "" then
            StatusLabel.Text = "⚠ Key tidak boleh kosong!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 180, 40)
            return
        end

        StatusLabel.Text = "⏳ Memverifikasi key..."
        StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        SubmitBtn.Active = false
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        SubmitBtn.TextColor3 = Color3.fromRGB(160, 160, 160)

        task.spawn(function()
            local validKeys = FetchValidKeys()

            if validKeys == nil then
                StatusLabel.Text = "❌ Gagal terhubung ke server key. Coba lagi."
                StatusLabel.TextColor3 = Color3.fromRGB(200, 60, 60)
                SubmitBtn.Active = true
                SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SubmitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                return
            end

            if validKeys[enteredKey] then
                StatusLabel.Text = "✔ Key valid! Memuat AMBA.HUB..."
                StatusLabel.TextColor3 = Color3.fromRGB(80, 220, 80)
                task.wait(1.2)
                KeyGui:Destroy()
                onSuccess()
            else
                StatusLabel.Text = "❌ Key salah atau tidak valid!"
                StatusLabel.TextColor3 = Color3.fromRGB(220, 60, 60)
                InputBox.Text = ""
                SubmitBtn.Active = true
                SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SubmitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            end
        end)
    end)
end

-- =============================================
-- AMBA.HUB MAIN SCRIPT (FINAL FIX)
-- =============================================
local function LoadAMBAHub()

    local Camera = workspace.CurrentCamera
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local Teams = game:GetService("Teams")

    _G.AimbotEnabled = false
    _G.TriggerBot = false
    _G.NoRecoil = false
    _G.AntiReport = false
    _G.ESPEnabled = false
    _G.ESPLineEnabled = false
    _G.CircleRadius = 300
    _G.TriggerBotDelay = 0.1
    _G.FpsBoostActive = false
    _G.PingOptimizer = false
    _G.ShadowLockEnabled = false
    _G.ShadowTarget = nil
    _G.AntiAimbot = false
    _G.TeamTargetEnabled = false

    local BoneList = {"HEAD", "TORSO", "LEGS"}
    local CurrentBoneIndex = 1
    _G.AimbotTargetBone = BoneList[CurrentBoneIndex]
    _G.WallCheckEnabled = false

    local TargetKekunci = nil

    local ColorList = {
        {Name = "WHITE", Color = Color3.fromRGB(255, 255, 255)},
        {Name = "RED", Color = Color3.fromRGB(255, 40, 40)},
        {Name = "BLUE", Color = Color3.fromRGB(40, 120, 255)}
    }
    local CurrentColorIndex = 1
    _G.ESPColor = ColorList[CurrentColorIndex].Color

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

    if game:GetService("CoreGui"):FindFirstChild("AMBA.HUB") then
        game:GetService("CoreGui")["AMBA.HUB"]:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AMBA.HUB"
    ScreenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

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

    local function ApplyButtonEffects(btn)
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Theme.BtnHover, TextColor3 = Theme.AccentWhite}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Theme.BtnBg, TextColor3 = Theme.TextMain}):Play()
        end)
        btn.MouseButton1Down:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0.96, 0, 0.96, 0)}):Play()
        end)
        btn.MouseButton1Up:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)}):Play()
        end)
    end

    local MiniBox = Instance.new("CanvasGroup")
    MiniBox.Name = "MiniBox"; MiniBox.Parent = ScreenGui; MiniBox.Size = UDim2.new(0, 48, 0, 48)
    MiniBox.Position = UDim2.new(0.02, 0, 0.85, 0); MiniBox.BackgroundTransparency = 1; MiniBox.Visible = false; MiniBox.ZIndex = 30
    Instance.new("UICorner", MiniBox).CornerRadius = UDim.new(1, 0)

    local MiniBtnActual = Instance.new("TextButton")
    MiniBtnActual.Name = "MiniBtnActual"; MiniBtnActual.Parent = MiniBox; MiniBtnActual.Size = UDim2.new(1, 0, 1, 0)
    MiniBtnActual.BackgroundColor3 = Theme.Background; MiniBtnActual.Text = "A"; MiniBtnActual.TextColor3 = Theme.AccentWhite
    MiniBtnActual.TextSize = 20; MiniBtnActual.Font = Enum.Font.SourceSansBold; MiniBtnActual.ZIndex = 31
    local MiniStroke = Instance.new("UIStroke"); MiniStroke.Color = Theme.Border; MiniStroke.Thickness = 1.5; MiniStroke.Parent = MiniBtnActual

    local MainFrame = Instance.new("CanvasGroup")
    MainFrame.Name = "MainFrame"; MainFrame.Parent = ScreenGui; MainFrame.BackgroundColor3 = Theme.Background
    MainFrame.BorderSizePixel = 0; MainFrame.Position = UDim2.new(0.5, -270, 0.5, -195)
    MainFrame.Size = UDim2.new(0, 540, 0, 390); MainFrame.Active = true; MainFrame.Draggable = true; MainFrame.ZIndex = 1
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
    local MainFrameStroke = Instance.new("UIStroke"); MainFrameStroke.Color = Theme.Border; MainFrameStroke.Thickness = 1; MainFrameStroke.Parent = MainFrame

    local MainBg = Instance.new("ImageLabel"); MainBg.Parent = MainFrame; MainBg.BackgroundTransparency = 1
    MainBg.Size = UDim2.new(1, 0, 1, 0); MainBg.Image = "rbxassetid://121562925685767"; MainBg.ImageTransparency = 0.6; MainBg.ZIndex = 2

    local TabBar = Instance.new("Frame"); TabBar.Parent = MainFrame; TabBar.BackgroundColor3 = Theme.TopBar; TabBar.Size = UDim2.new(1, 0, 0, 50); TabBar.ZIndex = 4
    Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0, 10)
    local HideTopBarCorner = Instance.new("Frame"); HideTopBarCorner.Parent = TabBar; HideTopBarCorner.BackgroundColor3 = Theme.TopBar
    HideTopBarCorner.BorderSizePixel = 0; HideTopBarCorner.Position = UDim2.new(0, 0, 0.8, 0); HideTopBarCorner.Size = UDim2.new(1, 0, 0.2, 0); HideTopBarCorner.ZIndex = 3

    local Title = Instance.new("TextLabel"); Title.Parent = TabBar; Title.Size = UDim2.new(0.28, 0, 1, 0)
    Title.BackgroundTransparency = 1; Title.Text = "  AMBA.HUB"; Title.TextColor3 = Theme.AccentWhite
    Title.TextSize = 18; Title.Font = Enum.Font.SourceSansBold; Title.ZIndex = 5

    local Tabs = {}
    local function CreateTabBtn(text, pos, id)
        local btn = Instance.new("TextButton"); btn.Parent = TabBar; btn.Position = pos
        btn.Size = UDim2.new(0, 75, 1, 0); btn.BackgroundTransparency = 1; btn.Text = text
        btn.TextColor3 = Theme.TextDark; btn.Font = Enum.Font.SourceSansBold; btn.TextSize = 14; btn.ZIndex = 5
        Tabs[id] = btn; return btn
    end

    local MainTabBtn = CreateTabBtn("MAIN", UDim2.new(0.32, 0, 0, 0), "Main")
    local BoostTabBtn = CreateTabBtn("BOOST", UDim2.new(0.48, 0, 0, 0), "Boost")
    MainTabBtn.TextColor3 = Theme.AccentWhite

    local function CreatePage()
        local f = Instance.new("CanvasGroup"); f.Parent = MainFrame; f.BackgroundTransparency = 1
        f.Position = UDim2.new(0, 0, 0.13, 0); f.Size = UDim2.new(1, 0, 0.87, 0); f.Visible = false; f.ZIndex = 6; return f
    end

    local MainPage = CreatePage(); MainPage.Visible = true
    local BoostPage = CreatePage()

    local function CreateActionBtn(parent, text, pos)
        local Container = Instance.new("Frame"); Container.Parent = parent; Container.Position = pos
        Container.Size = UDim2.new(0, 225, 0, 34); Container.BackgroundTransparency = 1; Container.ZIndex = 7
        local btn = Instance.new("TextButton"); btn.Name = "Btn"; btn.Parent = Container
        btn.Size = UDim2.new(1, 0, 1, 0); btn.BackgroundColor3 = Theme.BtnBg; btn.BorderSizePixel = 0
        btn.Text = text; btn.TextColor3 = Theme.TextMain; btn.TextSize = 13; btn.Font = Enum.Font.SourceSansBold; btn.ZIndex = 8
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        local btnStroke = Instance.new("UIStroke"); btnStroke.Color = Theme.Border; btnStroke.Thickness = 1; btnStroke.Parent = btn
        ApplyButtonEffects(btn); return btn
    end

    local function UpdateToggleVisual(btn, state)
        local stroke = btn:FindFirstChildOfClass("UIStroke")
        if state then
            btn.TextColor3 = Theme.Background; btn.BackgroundColor3 = Theme.AccentWhite
            if stroke then stroke.Color = Theme.AccentWhite end
        else
            btn.TextColor3 = Theme.TextMain; btn.BackgroundColor3 = Theme.BtnBg
            if stroke then stroke.Color = Theme.Border end
        end
    end

    local AimBtn = CreateActionBtn(MainPage, "AUTO AIM: OFF", UDim2.new(0.05, 0, 0.02, 0))
    local TrigBtn = CreateActionBtn(MainPage, "TRIGGER BOT: OFF", UDim2.new(0.53, 0, 0.02, 0))
    local RecoilBtn = CreateActionBtn(MainPage, "NO RECOIL: OFF", UDim2.new(0.05, 0, 0.14, 0))
    local EspBtn = CreateActionBtn(MainPage, "ESP BOX: OFF", UDim2.new(0.53, 0, 0.14, 0))
    local EspLineBtn = CreateActionBtn(MainPage, "ESP LINE: OFF", UDim2.new(0.53, 0, 0.26, 0))
    local ProtectBtn = CreateActionBtn(MainPage, "ANTI-REPORT: OFF", UDim2.new(0.05, 0, 0.26, 0))
    local WallCheckBtn = CreateActionBtn(MainPage, "WALL CHECK: OFF", UDim2.new(0.05, 0, 0.38, 0))
    local ColorCycleBtn = CreateActionBtn(MainPage, "ESP COLOR: WHITE", UDim2.new(0.53, 0, 0.38, 0))
    local BoneBtn = CreateActionBtn(MainPage, "TARGET BONE: HEAD", UDim2.new(0.53, 0, 0.50, 0))

    WallCheckBtn.MouseButton1Click:Connect(function()
        _G.WallCheckEnabled = not _G.WallCheckEnabled
        WallCheckBtn.Text = "WALL CHECK: " .. (_G.WallCheckEnabled and "ON" or "OFF")
        UpdateToggleVisual(WallCheckBtn, _G.WallCheckEnabled)
    end)
    BoneBtn.MouseButton1Click:Connect(function()
        CurrentBoneIndex = CurrentBoneIndex + 1
        if CurrentBoneIndex > #BoneList then CurrentBoneIndex = 1 end
        _G.AimbotTargetBone = BoneList[CurrentBoneIndex]
        BoneBtn.Text = "TARGET BONE: " .. _G.AimbotTargetBone
    end)
    ColorCycleBtn.MouseButton1Click:Connect(function()
        CurrentColorIndex = CurrentColorIndex + 1
        if CurrentColorIndex > #ColorList then CurrentColorIndex = 1 end
        local selectedData = ColorList[CurrentColorIndex]
        _G.ESPColor = selectedData.Color
        ColorCycleBtn.Text = "ESP COLOR: " .. selectedData.Name
        local stroke = ColorCycleBtn:FindFirstChildOfClass("UIStroke")
        if stroke then stroke.Color = selectedData.Color end
    end)

    local TargetInput = Instance.new("TextBox")
    TargetInput.Parent = MainPage; TargetInput.Position = UDim2.new(0.05, 0, 0.50, 0)
    TargetInput.Size = UDim2.new(0, 225, 0, 34); TargetInput.BackgroundColor3 = Theme.BtnBg; TargetInput.BorderSizePixel = 0
    TargetInput.PlaceholderText = "Nama target..."; TargetInput.PlaceholderColor3 = Theme.TextDark; TargetInput.Text = ""
    TargetInput.TextColor3 = Theme.TextMain; TargetInput.TextSize = 13; TargetInput.Font = Enum.Font.SourceSans; TargetInput.ZIndex = 7
    Instance.new("UICorner", TargetInput).CornerRadius = UDim.new(0, 5)
    local InputStroke = Instance.new("UIStroke"); InputStroke.Color = Theme.Border; InputStroke.Thickness = 1; InputStroke.Parent = TargetInput

    local SelectTargetBtn = CreateActionBtn(MainPage, "PILIH TARGET", UDim2.new(0.53, 0, 0.62, 0))
    local ShadowBtn = CreateActionBtn(MainPage, "SHADOW LOCK: OFF", UDim2.new(0.05, 0, 0.62, 0))
    local AntiAimBtn = CreateActionBtn(MainPage, "ANTI AIMBOT: OFF", UDim2.new(0.05, 0, 0.74, 0))
    local TeamAimBtn = CreateActionBtn(MainPage, "TEAM TARGET: OFF", UDim2.new(0.53, 0, 0.74, 0))
    local FpsBtn = CreateActionBtn(BoostPage, "FPS BOOST: OFF", UDim2.new(0.5, -112, 0.12, 0))

    local activeTab = "Main"
    local pagesMap = {Main = MainPage, Boost = BoostPage}
    local function SwitchTab(tabName)
        if activeTab == tabName then return end
        local oldPage = pagesMap[activeTab]; local newPage = pagesMap[tabName]; activeTab = tabName
        for id, btn in pairs(Tabs) do btn.TextColor3 = (id == tabName and Theme.AccentWhite or Theme.TextDark) end
        oldPage.Visible = false; newPage.Visible = true
    end
    MainTabBtn.MouseButton1Click:Connect(function() SwitchTab("Main") end)
    BoostTabBtn.MouseButton1Click:Connect(function() SwitchTab("Boost") end)

    TeamAimBtn.MouseButton1Click:Connect(function()
        _G.TeamTargetEnabled = not _G.TeamTargetEnabled
        TeamAimBtn.Text = "TEAM TARGET: " .. (_G.TeamTargetEnabled and "ON" or "OFF")
        UpdateToggleVisual(TeamAimBtn, _G.TeamTargetEnabled)
    end)

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

    local function IsEnemy(targetPlayer)
        if not targetPlayer or targetPlayer == LocalPlayer then 
            return false 
        end
        if _G.TeamTargetEnabled then 
            return true 
        end
        local allTeams = Teams:GetTeams()
        if #allTeams > 0 then
            if LocalPlayer.Team and targetPlayer.Team then
                return LocalPlayer.Team ~= targetPlayer.Team
            end
        end
        return true
    end

    TrigBtn.MouseButton1Click:Connect(function()
        _G.TriggerBot = not _G.TriggerBot
        TrigBtn.Text = "TRIGGER BOT: " .. (_G.TriggerBot and "ON" or "OFF")
        UpdateToggleVisual(TrigBtn, _G.TriggerBot)
    end)

    local function TriggerBotLogic()
        if not _G.TriggerBot then return end
        local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and IsEnemy(p) then
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

    local function GetTargetPart(character, boneType)
        if not character then return nil end
        local fallbackHead = character:FindFirstChild("Head")
        local fallbackRoot = character:FindFirstChild("HumanoidRootPart")
        
        if boneType == "HEAD" then
            if fallbackHead then return fallbackHead end
            for _, child in pairs(character:GetChildren()) do
                if child:IsA("BasePart") and child.Name:lower():find("head") then return child end
            end
        elseif boneType == "TORSO" then
            for _, name in pairs({"uppertorso", "torso", "lowertorso", "chest", "abs"}) do
                local found = character:FindFirstChild(name) or character:FindFirstChild(name:sub(1,1):upper()..name:sub(2))
                if found then return found end
            end
            for _, child in pairs(character:GetChildren()) do
                if child:IsA("BasePart") and (child.Name:lower():find("torso") or child.Name:lower():find("chest")) then return child end
            end
            if fallbackRoot then return fallbackRoot end
        elseif boneType == "LEGS" then
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

    function StartShadowLock()
        if ShadowConnection then ShadowConnection:Disconnect() end
        if CollisionConnection then CollisionConnection:Disconnect() end
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.PlatformStand = true
            char.Humanoid.AutoRotate = false
        end
        ShadowConnection = RunService.RenderStepped:Connect(function()
            if not _G.ShadowLockEnabled or not _G.ShadowTarget or not _G.ShadowTarget.Character then
                StopShadowLock(); return
            end
            local myChar = LocalPlayer.Character
            local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myHRP then StopShadowLock(); return end
            local tBone = GetTargetPart(_G.ShadowTarget.Character, _G.AimbotTargetBone)
            if not tBone then StopShadowLock(); return end
            local tp = tBone.Position
            local targetPos = tp + Vector3.new(math.sin(tick() * 5) * 4, math.cos(tick() * 7) * 1.5 + 3, math.cos(tick() * 5) * 4)
            myHRP.Velocity = (targetPos - myHRP.Position) * 10
            myHRP.CFrame = CFrame.new(myHRP.Position, Vector3.new(tp.X, myHRP.Position.Y, tp.Z))
        end)
        CollisionConnection = RunService.Stepped:Connect(function()
            local myChar = LocalPlayer.Character
            if myChar and _G.ShadowLockEnabled then
                for _, part in pairs(myChar:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    end

    function StopShadowLock()
        _G.ShadowLockEnabled = false
        if ShadowConnection then ShadowConnection:Disconnect(); ShadowConnection = nil end
        if CollisionConnection then CollisionConnection:Disconnect(); CollisionConnection = nil end
        local char = LocalPlayer.Character
        if char then
            if char:FindFirstChild("Humanoid") then
                char.Humanoid.PlatformStand = false
                char.Humanoid.AutoRotate = true
            end
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
        end
    end

    local function ClearAllESP()
        for p, v in pairs(Lines) do pcall(function() v:Remove() end) end; Lines = {}
        for p, v in pairs(Boxes) do pcall(function() v:Remove() end) end; Boxes = {}
        for p, v in pairs(Names) do pcall(function() v:Remove() end) end; Names = {}
        for p, v in pairs(Distances) do pcall(function() v:Remove() end) end; Distances = {}
        for p, v in pairs(HealthBars) do pcall(function() v:Remove() end) end; HealthBars = {}
        for p, v in pairs(HealthBarOutlines) do pcall(function() v:Remove() end) end; HealthBarOutlines = {}
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("AMBA_ESP") then
                pcall(function() p.Character.AMBA_ESP:Destroy() end)
            end
        end
    end

    EspBtn.MouseButton1Click:Connect(function()
        _G.ESPEnabled = not _G.ESPEnabled
        EspBtn.Text = "ESP BOX: " .. (_G.ESPEnabled and "ON" or "OFF")
        UpdateToggleVisual(EspBtn, _G.ESPEnabled)
        if not _G.ESPEnabled and not _G.ESPLineEnabled then ClearAllESP() end
    end)
    EspLineBtn.MouseButton1Click:Connect(function()
        _G.ESPLineEnabled = not _G.ESPLineEnabled
        EspLineBtn.Text = "ESP LINE: " .. (_G.ESPLineEnabled and "ON" or "OFF")
        UpdateToggleVisual(EspLineBtn, _G.ESPLineEnabled)
        if not _G.ESPEnabled and not _G.ESPLineEnabled then ClearAllESP() end
    end)
    AimBtn.MouseButton1Click:Connect(function()
        _G.AimbotEnabled = not _G.AimbotEnabled
        AimBtn.Text = "AUTO AIM: " .. (_G.AimbotEnabled and "ON" or "OFF")
        UpdateToggleVisual(AimBtn, _G.AimbotEnabled)
        if not _G.AimbotEnabled then TargetKekunci = nil end
    end)

    SelectTargetBtn.MouseButton1Click:Connect(function()
        local name = TargetInput.Text
        if name == "" then 
            SelectTargetBtn.Text = "MASUKKAN NAMA!"
            task.wait(1)
            SelectTargetBtn.Text = "PILIH TARGET"
            return 
        end
        local found = false
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Name:lower():find(name:lower()) then
                _G.ShadowTarget = p
                if p.Character then
                    local targetPart = GetTargetPart(p.Character, _G.AimbotTargetBone)
                    if targetPart then
                        TargetKekunci = targetPart
                    else
                        TargetKekunci = p.Character:FindFirstChild("HumanoidRootPart")
                    end
                else
                    task.spawn(function()
                        repeat task.wait(0.5) until p.Character
                        local targetPart = GetTargetPart(p.Character, _G.AimbotTargetBone)
                        TargetKekunci = targetPart or p.Character:FindFirstChild("HumanoidRootPart")
                    end)
                end
                SelectTargetBtn.Text = p.Name:upper()
                found = true
                break
            end
        end
        if not found then
            SelectTargetBtn.Text = "GAK KETEMU!"
            task.wait(1)
            SelectTargetBtn.Text = "PILIH TARGET"
        end
    end)

    ShadowBtn.MouseButton1Click:Connect(function()
        if not _G.ShadowTarget then return end
        _G.ShadowLockEnabled = not _G.ShadowLockEnabled
        ShadowBtn.Text = "SHADOW LOCK: " .. (_G.ShadowLockEnabled and "ON" or "OFF")
        UpdateToggleVisual(ShadowBtn, _G.ShadowLockEnabled)
        if _G.ShadowLockEnabled then StartShadowLock() else StopShadowLock() end
    end)

    RunService.RenderStepped:Connect(function()
        TriggerBotLogic()
        local mousePos = UserInputService:GetMouseLocation()

        if _G.AimbotEnabled then
            if _G.ShadowLockEnabled and _G.ShadowTarget and _G.ShadowTarget.Character then
                local targetPart = GetTargetPart(_G.ShadowTarget.Character, _G.AimbotTargetBone)
                if targetPart then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPart.Position)
                end
            elseif UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                local targetValid = false
                if TargetKekunci and TargetKekunci.Parent then
                    local char = TargetKekunci.Parent
                    local hum = char:FindFirstChild("Humanoid")
                    if hum and hum.Health > 0 then
                        local player = Players:GetPlayerFromCharacter(char)
                        if player and (IsEnemy(player) or _G.TeamTargetEnabled) and IsPlayerVisible(TargetKekunci) then
                            targetValid = true
                        end
                    end
                end

                if not targetValid then
                    if TargetKekunci == nil then
                        local closestDist = _G.CircleRadius
                        local bestPart = nil
                        for _, p in pairs(Players:GetPlayers()) do
                            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                                if not IsEnemy(p) and not _G.TeamTargetEnabled then continue end
                                local hum = p.Character.Humanoid
                                if hum.Health > 0 then
                                    local part = GetTargetPart(p.Character, _G.AimbotTargetBone)
                                    if part and IsPlayerVisible(part) then
                                        local pos, vis = Camera:WorldToViewportPoint(part.Position)
                                        if vis then
                                            local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                                            if dist < closestDist then
                                                closestDist = dist
                                                bestPart = part
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        TargetKekunci = bestPart
                    else
                        TargetKekunci = nil
                    end
                end

                if TargetKekunci and TargetKekunci.Parent then
                    local char = TargetKekunci.Parent
                    local hum = char:FindFirstChild("Humanoid")
                    if hum and hum.Health > 0 then
                        local player = Players:GetPlayerFromCharacter(char)
                        if player and (IsEnemy(player) or _G.TeamTargetEnabled) and IsPlayerVisible(TargetKekunci) then
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, TargetKekunci.Position)
                        else
                            TargetKekunci = nil
                        end
                    else
                        TargetKekunci = nil
                    end
                end
            else
                TargetKekunci = nil
            end
        end

        for _, p in pairs(Players:GetPlayers()) do
            local d_box = Boxes[p]; local d_line = Lines[p]; local d_name = Names[p]
            local d_dist = Distances[p]; local d_hBar = HealthBars[p]; local d_hOutline = HealthBarOutlines[p]
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
                local hrp = p.Character.HumanoidRootPart; local hum = p.Character.Humanoid
                if hum.Health > 0 and IsEnemy(p) then
                    local pos, vis = Camera:WorldToViewportPoint(hrp.Position)
                    if vis then
                        local sizeX, sizeY = 2500 / pos.Z, 4000 / pos.Z
                        local boxX, boxY = pos.X - sizeX / 2, pos.Y - sizeY / 2
                        local distanceStuds = math.floor((LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) or 0)
                        if _G.ESPLineEnabled then
                            if not d_line then Lines[p] = Drawing.new("Line"); d_line = Lines[p]; d_line.Thickness = 1 end
                            d_line.Color = _G.ESPColor
                            d_line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 15)
                            d_line.To = Vector2.new(pos.X, pos.Y); d_line.Visible = true
                        else
                            if d_line then d_line.Visible = false end
                        end
                        if _G.ESPEnabled then
                            if not d_box then Boxes[p] = Drawing.new("Square"); d_box = Boxes[p]; d_box.Thickness = 1; d_box.Filled = false end
                            d_box.Color = _G.ESPColor; d_box.Size = Vector2.new(sizeX, sizeY); d_box.Position = Vector2.new(boxX, boxY); d_box.Visible = true
                            if not d_name then Names[p] = Drawing.new("Text"); d_name = Names[p]; d_name.Size = 13; d_name.Center = true; d_name.Outline = true end
                            d_name.Color = Theme.AccentWhite; d_name.Text = p.Name; d_name.Position = Vector2.new(pos.X, boxY - 16); d_name.Visible = true
                            if not d_dist then Distances[p] = Drawing.new("Text"); d_dist = Distances[p]; d_dist.Size = 12; d_dist.Center = true; d_dist.Outline = true end
                            d_dist.Color = Theme.TextDark; d_dist.Text = "[" .. distanceStuds .. " Studs]"; d_dist.Position = Vector2.new(pos.X, boxY + sizeY + 2); d_dist.Visible = true
                            if not d_hOutline then HealthBarOutlines[p] = Drawing.new("Square"); d_hOutline = HealthBarOutlines[p]; d_hOutline.Thickness = 1; d_hOutline.Filled = true; d_hOutline.Color = Color3.fromRGB(0,0,0) end
                            d_hOutline.Size = Vector2.new(4, sizeY); d_hOutline.Position = Vector2.new(boxX - 6, boxY); d_hOutline.Visible = true
                            if not d_hBar then HealthBars[p] = Drawing.new("Square"); d_hBar = HealthBars[p]; d_hBar.Thickness = 1; d_hBar.Filled = true end
                            local healthPercent = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                            d_hBar.Color = Color3.fromRGB(255 - (255 * healthPercent), 255 * healthPercent, 0)
                            d_hBar.Size = Vector2.new(2, sizeY * healthPercent)
                            d_hBar.Position = Vector2.new(boxX - 5, boxY + (sizeY * (1 - healthPercent))); d_hBar.Visible = true
                            local highlight = p.Character:FindFirstChild("AMBA_ESP")
                            if not highlight then
                                highlight = Instance.new("Highlight"); highlight.Name = "AMBA_ESP"
                                highlight.FillTransparency = 0.6; highlight.OutlineTransparency = 0.3
                                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; highlight.Parent = p.Character
                            end
                            highlight.FillColor = _G.ESPColor; highlight.OutlineColor = _G.ESPColor
                        else
                            if d_box then d_box.Visible = false end; if d_name then d_name.Visible = false end
                            if d_dist then d_dist.Visible = false end; if d_hBar then d_hBar.Visible = false end
                            if d_hOutline then d_hOutline.Visible = false end
                            if p.Character and p.Character:FindFirstChild("AMBA_ESP") then pcall(function() p.Character.AMBA_ESP:Destroy() end) end
                        end
                        continue
                    end
                end
            end
            if d_line then d_line.Visible = false end; if d_box then d_box.Visible = false end
            if d_name then d_name.Visible = false end; if d_dist then d_dist.Visible = false end
            if d_hBar then d_hBar.Visible = false end; if d_hOutline then d_hOutline.Visible = false end
            if p.Character and p.Character:FindFirstChild("AMBA_ESP") then pcall(function() p.Character.AMBA_ESP:Destroy() end) end
        end
    end)

    local MinimizeBtn = Instance.new("TextButton"); MinimizeBtn.Parent = TabBar
    MinimizeBtn.Position = UDim2.new(1, -42, 0, 11); MinimizeBtn.Size = UDim2.new(0, 28, 0, 28)
    MinimizeBtn.BackgroundTransparency = 1; MinimizeBtn.Text = "—"; MinimizeBtn.TextColor3 = Theme.TextDark
    MinimizeBtn.TextSize = 14; MinimizeBtn.Font = Enum.Font.SourceSansBold; MinimizeBtn.ZIndex = 10
    MinimizeBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false; MiniBox.Visible = true end)
    MiniBtnActual.MouseButton1Click:Connect(function() MiniBox.Visible = false; MainFrame.Visible = true end)

    print("AMBA.HUB V20 LOADED - AIMBOT FINAL FIXED (NO AUTO-SWITCH) - TEAM TARGET ADDED BY BEXUS")

end

RunKeySystem(LoadAMBAHub)
