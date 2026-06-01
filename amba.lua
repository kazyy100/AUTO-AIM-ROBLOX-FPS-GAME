--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0 = game:GetService("HttpService");
local v1 = game:GetService("Players");
local v2 = v1.LocalPlayer;
local v3 = "https://gist.githubusercontent.com/kazyy100/f2d9a17322e3f58300e8d50cac20c6d5/raw/475382cc1e066589e928e32e03e005970ea90413/gistfile1.txt";
local function v4()
	local v8 = 0 - 0;
	local v9;
	local v10;
	local v11;
	while true do
		if (v8 == (964 - (683 + 281))) then
			v9 = 0;
			v10 = nil;
			v8 = 1;
		end
		if (v8 == (1 + 0)) then
			v11 = nil;
			while true do
				local v430 = 0 + 0;
				while true do
					if (v430 == 0) then
						if (v9 == (0 - 0)) then
							local v572 = 0 - 0;
							while true do
								if (v572 == (1552 - (1126 + 425))) then
									v9 = 1;
									break;
								end
								if (v572 == 0) then
									v10, v11 = pcall(function()
										return game:HttpGet(v3);
									end);
									if (v10 and v11) then
										local v679 = 405 - (118 + 287);
										local v680;
										while true do
											if (1 == v679) then
												return v680;
											end
											if (v679 == (0 - 0)) then
												v680 = {};
												for v709 in v11:gmatch("[^\r\n]+") do
													local v710 = 1121 - (118 + 1003);
													local v711;
													while true do
														if (v710 == 0) then
															v711 = v709:match("^%s*(.-)%s*$");
															if (v711 ~= "") then
																v680[v711] = true;
															end
															break;
														end
													end
												end
												v679 = 2 - 1;
											end
										end
									end
									v572 = 378 - (142 + 235);
								end
							end
						end
						if (v9 == (4 - 3)) then
							return nil;
						end
						break;
					end
				end
			end
			break;
		end
	end
end
local function v5()
	local v12 = 0 + 0;
	local v13;
	local v14;
	local v15;
	local v16;
	local v17;
	local v18;
	local v19;
	local v20;
	local v21;
	local v22;
	local v23;
	local v24;
	local v25;
	local v26;
	while true do
		if (v12 == (979 - (553 + 424))) then
			v16 = Instance.new("UIStroke");
			v16.Parent = v15;
			v16.Color = Color3.fromRGB(113 - 53, 53 + 7, 60 + 0);
			v16.Thickness = 1.5;
			v17 = Instance.new("Frame");
			v17.Parent = v15;
			v17.Size = UDim2.new(1, 0 + 0, 0, 21 + 27);
			v17.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
			v17.BorderSizePixel = 0;
			v17.ZIndex = 3;
			v12 = 2 + 1;
		end
		if ((21 - 11) == v12) then
			Instance.new("UICorner", v24).CornerRadius = UDim.new(0 - 0, 17 - 9);
			v24.MouseEnter:Connect(function()
				v24.BackgroundColor3 = Color3.fromRGB(220, 64 + 156, 1063 - 843);
			end);
			v24.MouseLeave:Connect(function()
				v24.BackgroundColor3 = Color3.fromRGB(1008 - (239 + 514), 90 + 165, 1584 - (797 + 532));
			end);
			v25 = Instance.new("TextButton");
			v25.Parent = v15;
			v25.Position = UDim2.new(0, 15 + 5, 0 + 0, 222);
			v25.Size = UDim2.new(2 - 1, -(1242 - (373 + 829)), 731 - (476 + 255), 1166 - (369 + 761));
			v25.BackgroundColor3 = Color3.fromRGB(12 + 8, 20, 36 - 16);
			v25.BorderSizePixel = 0 - 0;
			v25.Text = "🔑  GET KEY  →  sfl.gl/nyx8H";
			v12 = 249 - (64 + 174);
		end
		if ((2 + 6) == v12) then
			v23.Position = UDim2.new(0 - 0, 356 - (144 + 192), 0, 356 - (42 + 174));
			v23.Size = UDim2.new(1 + 0, -(34 + 6), 0, 9 + 11);
			v23.BackgroundTransparency = 1505 - (363 + 1141);
			v23.Text = "";
			v23.TextColor3 = Color3.fromRGB(200, 1660 - (1183 + 397), 243 - 163);
			v23.TextSize = 10 + 3;
			v23.Font = Enum.Font.SourceSans;
			v23.TextXAlignment = Enum.TextXAlignment.Center;
			v23.ZIndex = 3 + 0;
			v24 = Instance.new("TextButton");
			v12 = 1984 - (1913 + 62);
		end
		if ((3 + 1) == v12) then
			v19.Size = UDim2.new(2 - 1, 0, 1934 - (565 + 1368), 0);
			v19.BackgroundTransparency = 1;
			v19.Text = "  AMBA.HUB  //  KEY SYSTEM";
			v19.TextColor3 = Color3.fromRGB(958 - 703, 255, 255);
			v19.TextSize = 1677 - (1477 + 184);
			v19.Font = Enum.Font.SourceSansBold;
			v19.TextXAlignment = Enum.TextXAlignment.Left;
			v19.ZIndex = 4;
			v20 = Instance.new("TextLabel");
			v20.Parent = v15;
			v12 = 5;
		end
		if (v12 == (15 - 3)) then
			v25.MouseLeave:Connect(function()
				local v433 = 0 + 0;
				while true do
					if (v433 == 0) then
						v25.BackgroundColor3 = Color3.fromRGB(20, 20, 876 - (564 + 292));
						v25.TextColor3 = Color3.fromRGB(310 - 130, 180, 180);
						v433 = 1;
					end
					if (v433 == (2 - 1)) then
						v26.Color = Color3.fromRGB(364 - (244 + 60), 60, 60);
						break;
					end
				end
			end);
			v25.MouseButton1Click:Connect(function()
				local v434 = 0 + 0;
				local v435;
				while true do
					if ((476 - (41 + 435)) == v434) then
						v435 = 0;
						while true do
							if (v435 == (1003 - (938 + 63))) then
								task.wait(2.5 + 0);
								v25.Text = "🔑  GET KEY  →  sfl.gl/nyx8H";
								v435 = 1128 - (936 + 189);
							end
							if (v435 == (0 + 0)) then
								pcall(function()
									setclipboard("https://sfl.gl/ISXiCFTJ");
								end);
								pcall(function()
									game:GetService("GuiService"):OpenBrowserWindow("https://sfl.gl/ISXiCFTJ");
								end);
								v435 = 1614 - (1565 + 48);
							end
							if (v435 == 3) then
								v25.TextColor3 = Color3.fromRGB(112 + 68, 1318 - (782 + 356), 447 - (176 + 91));
								break;
							end
							if (v435 == (2 - 1)) then
								v25.Text = "✔  Link disalin! Buka browser kamu";
								v25.TextColor3 = Color3.fromRGB(80, 324 - 104, 80);
								v435 = 1094 - (975 + 117);
							end
						end
						break;
					end
				end
			end);
			return v13, v21, v24, v23;
		end
		if (v12 == (1882 - (157 + 1718))) then
			v21.Font = Enum.Font.SourceSansBold;
			v21.ClearTextOnFocus = false;
			v21.ZIndex = 3;
			Instance.new("UICorner", v21).CornerRadius = UDim.new(0 + 0, 28 - 20);
			v22 = Instance.new("UIStroke");
			v22.Parent = v21;
			v22.Color = Color3.fromRGB(170 - 120, 50, 1068 - (697 + 321));
			v22.Thickness = 2 - 1;
			v23 = Instance.new("TextLabel");
			v23.Parent = v15;
			v12 = 16 - 8;
		end
		if (v12 == (6 - 3)) then
			Instance.new("UICorner", v17).CornerRadius = UDim.new(0, 5 + 7);
			v18 = Instance.new("Frame");
			v18.Parent = v17;
			v18.Size = UDim2.new(1 - 0, 0 - 0, 1227.4 - (322 + 905), 611 - (602 + 9));
			v18.Position = UDim2.new(0, 1189 - (449 + 740), 872.6 - (826 + 46), 947 - (245 + 702));
			v18.BackgroundColor3 = Color3.fromRGB(56 - 38, 18, 6 + 12);
			v18.BorderSizePixel = 1898 - (260 + 1638);
			v18.ZIndex = 443 - (382 + 58);
			v19 = Instance.new("TextLabel");
			v19.Parent = v17;
			v12 = 12 - 8;
		end
		if (v12 == 6) then
			v21.Parent = v15;
			v21.Position = UDim2.new(0 + 0, 41 - 21, 0, 267 - 177);
			v21.Size = UDim2.new(1, -(1245 - (902 + 303)), 0 - 0, 100 - 58);
			v21.BackgroundColor3 = Color3.fromRGB(2 + 18, 20, 1710 - (1121 + 569));
			v21.BorderSizePixel = 0;
			v21.PlaceholderText = "Masukkan key kamu di sini...";
			v21.PlaceholderColor3 = Color3.fromRGB(80, 294 - (22 + 192), 80);
			v21.Text = "";
			v21.TextColor3 = Color3.fromRGB(923 - (483 + 200), 1703 - (1404 + 59), 240);
			v21.TextSize = 14;
			v12 = 19 - 12;
		end
		if (v12 == 5) then
			v20.Position = UDim2.new(0 - 0, 785 - (468 + 297), 0, 620 - (334 + 228));
			v20.Size = UDim2.new(3 - 2, -(92 - 52), 0 - 0, 20);
			v20.BackgroundTransparency = 1;
			v20.Text = "Masukkan key untuk mengakses AMBA.HUB";
			v20.TextColor3 = Color3.fromRGB(130, 130, 37 + 93);
			v20.TextSize = 249 - (141 + 95);
			v20.Font = Enum.Font.SourceSans;
			v20.TextXAlignment = Enum.TextXAlignment.Left;
			v20.ZIndex = 3 + 0;
			v21 = Instance.new("TextBox");
			v12 = 15 - 9;
		end
		if (v12 == (21 - 12)) then
			v24.Parent = v15;
			v24.Position = UDim2.new(0 + 0, 54 - 34, 0 + 0, 170);
			v24.Size = UDim2.new(1 + 0, -(56 - 16), 0 + 0, 44);
			v24.BackgroundColor3 = Color3.fromRGB(418 - (92 + 71), 255, 126 + 129);
			v24.BorderSizePixel = 0;
			v24.Text = "SUBMIT KEY";
			v24.TextColor3 = Color3.fromRGB(0 - 0, 0, 765 - (574 + 191));
			v24.TextSize = 15;
			v24.Font = Enum.Font.SourceSansBold;
			v24.ZIndex = 3;
			v12 = 9 + 1;
		end
		if (v12 == (2 - 1)) then
			v14.BackgroundTransparency = 0.4;
			v14.ZIndex = 1 + 0;
			v15 = Instance.new("Frame");
			v15.Parent = v13;
			v15.Size = UDim2.new(0, 1269 - (254 + 595), 0, 290);
			v15.Position = UDim2.new(0.5, -210, 126.5 - (55 + 71), -(190 - 45));
			v15.BackgroundColor3 = Color3.fromRGB(10, 1800 - (573 + 1217), 27 - 17);
			v15.BorderSizePixel = 0 + 0;
			v15.ZIndex = 2 - 0;
			Instance.new("UICorner", v15).CornerRadius = UDim.new(0, 12);
			v12 = 941 - (714 + 225);
		end
		if (11 == v12) then
			v25.TextColor3 = Color3.fromRGB(526 - 346, 250 - 70, 180);
			v25.TextSize = 2 + 11;
			v25.Font = Enum.Font.SourceSansBold;
			v25.ZIndex = 3 - 0;
			Instance.new("UICorner", v25).CornerRadius = UDim.new(0, 8);
			v26 = Instance.new("UIStroke");
			v26.Parent = v25;
			v26.Color = Color3.fromRGB(866 - (118 + 688), 60, 60);
			v26.Thickness = 49 - (25 + 23);
			v25.MouseEnter:Connect(function()
				local v436 = 0 + 0;
				while true do
					if (v436 == (1886 - (927 + 959))) then
						v25.BackgroundColor3 = Color3.fromRGB(117 - 82, 767 - (16 + 716), 67 - 32);
						v25.TextColor3 = Color3.fromRGB(352 - (11 + 86), 621 - 366, 540 - (175 + 110));
						v436 = 2 - 1;
					end
					if (v436 == (4 - 3)) then
						v26.Color = Color3.fromRGB(1916 - (503 + 1293), 335 - 215, 120);
						break;
					end
				end
			end);
			v12 = 12;
		end
		if (0 == v12) then
			if game:GetService("CoreGui"):FindFirstChild("AMBA_KEY_UI") then
				game:GetService("CoreGui")['AMBA_KEY_UI']:Destroy();
			end
			v13 = Instance.new("ScreenGui");
			v13.Name = "AMBA_KEY_UI";
			v13.Parent = game:GetService("CoreGui");
			v13.ResetOnSpawn = false;
			v13.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
			v14 = Instance.new("Frame");
			v14.Parent = v13;
			v14.Size = UDim2.new(1, 0 + 0, 1, 1061 - (810 + 251));
			v14.BackgroundColor3 = Color3.fromRGB(0 + 0, 0 + 0, 0 + 0);
			v12 = 1;
		end
	end
end
local function v6(v27)
	local v28, v29, v30, v31 = v5();
	v30.MouseButton1Click:Connect(function()
		local v201 = 0;
		local v202;
		while true do
			if (v201 == 0) then
				v202 = v29.Text:match("^%s*(.-)%s*$");
				if (v202 == "") then
					local v505 = 0;
					while true do
						if (v505 == (534 - (43 + 490))) then
							return;
						end
						if (v505 == (733 - (711 + 22))) then
							v31.Text = "⚠ Key tidak boleh kosong!";
							v31.TextColor3 = Color3.fromRGB(255, 696 - 516, 899 - (240 + 619));
							v505 = 1 + 0;
						end
					end
				end
				v201 = 1 - 0;
			end
			if (v201 == 3) then
				v30.TextColor3 = Color3.fromRGB(160, 11 + 149, 160);
				task.spawn(function()
					local v476 = v4();
					if (v476 == nil) then
						local v532 = 0;
						while true do
							if (v532 == (1745 - (1344 + 400))) then
								v30.Active = true;
								v30.BackgroundColor3 = Color3.fromRGB(660 - (255 + 150), 201 + 54, 137 + 118);
								v532 = 8 - 6;
							end
							if (v532 == (6 - 4)) then
								v30.TextColor3 = Color3.fromRGB(0, 0, 1739 - (404 + 1335));
								return;
							end
							if (v532 == (406 - (183 + 223))) then
								v31.Text = "❌ Gagal terhubung ke server key. Coba lagi.";
								v31.TextColor3 = Color3.fromRGB(243 - 43, 40 + 20, 60);
								v532 = 1 + 0;
							end
						end
					end
					if v476[v202] then
						local v533 = 337 - (10 + 327);
						while true do
							if (v533 == (1 + 0)) then
								task.wait(1.2);
								v28:Destroy();
								v533 = 340 - (118 + 220);
							end
							if (v533 == (1 + 1)) then
								v27();
								break;
							end
							if (v533 == 0) then
								v31.Text = "✔ Key valid! Memuat AMBA.HUB...";
								v31.TextColor3 = Color3.fromRGB(529 - (108 + 341), 220, 36 + 44);
								v533 = 4 - 3;
							end
						end
					else
						local v534 = 1493 - (711 + 782);
						local v535;
						while true do
							if (v534 == (0 - 0)) then
								v535 = 469 - (270 + 199);
								while true do
									if (v535 == 0) then
										v31.Text = "❌ Key salah atau tidak valid!";
										v31.TextColor3 = Color3.fromRGB(72 + 148, 60, 60);
										v535 = 1820 - (580 + 1239);
									end
									if (v535 == 1) then
										v29.Text = "";
										v30.Active = true;
										v535 = 5 - 3;
									end
									if (v535 == 2) then
										v30.BackgroundColor3 = Color3.fromRGB(244 + 11, 255, 10 + 245);
										v30.TextColor3 = Color3.fromRGB(0 + 0, 0, 0);
										break;
									end
								end
								break;
							end
						end
					end
				end);
				break;
			end
			if (v201 == (4 - 2)) then
				v30.Active = false;
				v30.BackgroundColor3 = Color3.fromRGB(50 + 30, 80, 1247 - (645 + 522));
				v201 = 1793 - (1010 + 780);
			end
			if (v201 == (1 + 0)) then
				v31.Text = "⏳ Memverifikasi key...";
				v31.TextColor3 = Color3.fromRGB(857 - 677, 527 - 347, 2016 - (1045 + 791));
				v201 = 2;
			end
		end
	end);
end
local function v7()
	local v32 = workspace.CurrentCamera;
	local v33 = game:GetService("RunService");
	local v34 = game:GetService("TweenService");
	local v35 = game:GetService("UserInputService");
	local v36 = game:GetService("Lighting");
	local v37 = game:GetService("VirtualInputManager");
	local v38 = game:GetService("Teams");
	_G.AimbotEnabled = false;
	_G.TriggerBot = false;
	_G.NoRecoil = false;
	_G.AntiReport = false;
	_G.ESPEnabled = false;
	_G.ESPLineEnabled = false;
	_G.CircleRadius = 300;
	_G.TriggerBotDelay = 0.1 - 0;
	_G.FpsBoostActive = false;
	_G.PingOptimizer = false;
	_G.ShadowLockEnabled = false;
	_G.ShadowTarget = nil;
	_G.AntiAimbot = false;
	local v39 = {"HEAD","TORSO","LEGS"};
	local v40 = 1575 - (1281 + 293);
	_G.AimbotTargetBone = v39[v40];
	_G.WallCheckEnabled = false;
	local v42 = nil;
	local v43 = {{Name="WHITE",Color=Color3.fromRGB(521 - (28 + 238), 569 - 314, 1814 - (1381 + 178))},{Name="RED",Color=Color3.fromRGB(206 + 49, 18 + 22, 137 - 97)},{Name="BLUE",Color=Color3.fromRGB(510 - (381 + 89), 107 + 13, 173 + 82)}};
	local v44 = 1 - 0;
	_G.ESPColor = v43[v44].Color;
	local v46 = {};
	local v47 = {};
	local v48 = {};
	local v49 = {};
	local v50 = {};
	local v51 = {};
	local v52 = {};
	local v53 = {};
	local v54 = 1156 - (1074 + 82);
	local v55 = nil;
	local v56 = nil;
	local v57 = nil;
	if game:GetService("CoreGui"):FindFirstChild("AMBA.HUB") then
		game:GetService("CoreGui")["AMBA.HUB"]:Destroy();
	end
	local v58 = Instance.new("ScreenGui");
	v58.Name = "AMBA.HUB";
	v58.Parent = game:GetService("CoreGui") or v2:WaitForChild("PlayerGui");
	v58.ResetOnSpawn = false;
	local v62 = {Background=Color3.fromRGB(21 - 11, 1794 - (214 + 1570), 10),TopBar=Color3.fromRGB(1473 - (990 + 465), 18, 18),AccentWhite=Color3.fromRGB(255, 106 + 149, 255),TextMain=Color3.fromRGB(105 + 135, 234 + 6, 944 - 704),TextDark=Color3.fromRGB(1846 - (1668 + 58), 746 - (512 + 114), 312 - 192),BtnBg=Color3.fromRGB(20, 20, 20),BtnHover=Color3.fromRGB(72 - 37, 121 - 86, 35),Border=Color3.fromRGB(19 + 21, 40, 8 + 32)};
	local function v63(v203)
		local v204 = 0 + 0;
		while true do
			if (v204 == (3 - 2)) then
				v203.MouseButton1Down:Connect(function()
					v34:Create(v203, TweenInfo.new(1994.08 - (109 + 1885), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size=UDim2.new(1469.96 - (1269 + 200), 0 - 0, 815.96 - (98 + 717), 826 - (802 + 24))}):Play();
				end);
				v203.MouseButton1Up:Connect(function()
					v34:Create(v203, TweenInfo.new(0.12 - 0, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size=UDim2.new(1 - 0, 0 + 0, 1 + 0, 0 + 0)}):Play();
				end);
				break;
			end
			if (v204 == 0) then
				v203.MouseEnter:Connect(function()
					v34:Create(v203, TweenInfo.new(0.2 + 0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3=v62.BtnHover,TextColor3=v62.AccentWhite}):Play();
				end);
				v203.MouseLeave:Connect(function()
					v34:Create(v203, TweenInfo.new(0.2 - 0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3=v62.BtnBg,TextColor3=v62.TextMain}):Play();
				end);
				v204 = 1;
			end
		end
	end
	local v64 = Instance.new("CanvasGroup");
	v64.Name = "MiniBox";
	v64.Parent = v58;
	v64.Size = UDim2.new(0, 48, 0 - 0, 48);
	v64.Position = UDim2.new(0.02 + 0, 0, 0.85 + 0, 0 + 0);
	v64.BackgroundTransparency = 1 + 0;
	v64.Visible = false;
	v64.ZIndex = 15 + 15;
	Instance.new("UICorner", v64).CornerRadius = UDim.new(1434 - (797 + 636), 0);
	local v73 = Instance.new("TextButton");
	v73.Name = "MiniBtnActual";
	v73.Parent = v64;
	v73.Size = UDim2.new(4 - 3, 0, 1, 0);
	v73.BackgroundColor3 = v62.Background;
	v73.Text = "A";
	v73.TextColor3 = v62.AccentWhite;
	v73.TextSize = 20;
	v73.Font = Enum.Font.SourceSansBold;
	v73.ZIndex = 1650 - (1427 + 192);
	local v86 = Instance.new("UIStroke");
	v86.Color = v62.Border;
	v86.Thickness = 1.5;
	v86.Parent = v73;
	local v91 = Instance.new("CanvasGroup");
	v91.Name = "MainFrame";
	v91.Parent = v58;
	v91.BackgroundColor3 = v62.Background;
	v91.BorderSizePixel = 0;
	v91.Position = UDim2.new(0.5, -(94 + 176), 0.5, -195);
	v91.Size = UDim2.new(0 - 0, 486 + 54, 0, 177 + 213);
	v91.Active = true;
	v91.Draggable = true;
	v91.ZIndex = 1;
	Instance.new("UICorner", v91).CornerRadius = UDim.new(326 - (192 + 134), 1286 - (316 + 960));
	local v102 = Instance.new("UIStroke");
	v102.Color = v62.Border;
	v102.Thickness = 1 + 0;
	v102.Parent = v91;
	local v106 = Instance.new("ImageLabel");
	v106.Parent = v91;
	v106.BackgroundTransparency = 1;
	v106.Size = UDim2.new(1, 0 + 0, 1 + 0, 0 - 0);
	v106.Image = "rbxassetid://121562925685767";
	v106.ImageTransparency = 0.6;
	v106.ZIndex = 2;
	local v113 = Instance.new("Frame");
	v113.Parent = v91;
	v113.BackgroundColor3 = v62.TopBar;
	v113.Size = UDim2.new(552 - (83 + 468), 1806 - (1202 + 604), 0, 233 - 183);
	v113.ZIndex = 6 - 2;
	Instance.new("UICorner", v113).CornerRadius = UDim.new(0, 27 - 17);
	local v120 = Instance.new("Frame");
	v120.Parent = v113;
	v120.BackgroundColor3 = v62.TopBar;
	v120.BorderSizePixel = 325 - (45 + 280);
	v120.Position = UDim2.new(0, 0 + 0, 0.8, 0 + 0);
	v120.Size = UDim2.new(1 + 0, 0, 0.2 + 0, 0 + 0);
	v120.ZIndex = 5 - 2;
	local v127 = Instance.new("TextLabel");
	v127.Parent = v113;
	v127.Size = UDim2.new(0.28, 0, 1912 - (340 + 1571), 0 + 0);
	v127.BackgroundTransparency = 1;
	v127.Text = "  AMBA.HUB";
	v127.TextColor3 = v62.AccentWhite;
	v127.TextSize = 1790 - (1733 + 39);
	v127.Font = Enum.Font.SourceSansBold;
	v127.ZIndex = 5;
	local v136 = {};
	local function v137(v205, v206, v207)
		local v208 = 0 - 0;
		local v209;
		while true do
			local v295 = 1034 - (125 + 909);
			while true do
				if (v295 == (1948 - (1096 + 852))) then
					if (v208 == (1 + 1)) then
						local v536 = 0 - 0;
						while true do
							if ((0 + 0) == v536) then
								v209.TextColor3 = v62.TextDark;
								v209.Font = Enum.Font.SourceSansBold;
								v536 = 513 - (409 + 103);
							end
							if (v536 == (237 - (46 + 190))) then
								v209.TextSize = 109 - (51 + 44);
								v208 = 1 + 2;
								break;
							end
						end
					end
					if (v208 == (1320 - (1114 + 203))) then
						v209.ZIndex = 731 - (228 + 498);
						v136[v207] = v209;
						return v209;
					end
					v295 = 1;
				end
				if (v295 == 1) then
					if (v208 == (0 + 0)) then
						local v539 = 0 + 0;
						while true do
							if (v539 == 1) then
								v209.Position = v206;
								v208 = 1;
								break;
							end
							if (v539 == (663 - (174 + 489))) then
								v209 = Instance.new("TextButton");
								v209.Parent = v113;
								v539 = 2 - 1;
							end
						end
					end
					if (v208 == (1906 - (830 + 1075))) then
						local v540 = 524 - (303 + 221);
						while true do
							if (v540 == (1269 - (231 + 1038))) then
								v209.Size = UDim2.new(0 + 0, 75, 1, 1162 - (171 + 991));
								v209.BackgroundTransparency = 4 - 3;
								v540 = 2 - 1;
							end
							if (v540 == (2 - 1)) then
								v209.Text = v205;
								v208 = 2;
								break;
							end
						end
					end
					break;
				end
			end
		end
	end
	local v138 = v137("MAIN", UDim2.new(0.32 + 0, 0, 0, 0), "Main");
	local v139 = v137("BOOST", UDim2.new(0.48, 0 - 0, 0 - 0, 0 - 0), "Boost");
	v138.TextColor3 = v62.AccentWhite;
	local function v141()
		local v210 = 0;
		local v211;
		while true do
			if (v210 == (6 - 4)) then
				v211.Size = UDim2.new(1249 - (111 + 1137), 158 - (91 + 67), 0.87 - 0, 0);
				v211.Visible = false;
				v210 = 3;
			end
			if ((1 + 0) == v210) then
				v211.BackgroundTransparency = 524 - (423 + 100);
				v211.Position = UDim2.new(0 + 0, 0 - 0, 0.13 + 0, 0);
				v210 = 773 - (326 + 445);
			end
			if (v210 == 0) then
				v211 = Instance.new("CanvasGroup");
				v211.Parent = v91;
				v210 = 4 - 3;
			end
			if (v210 == (6 - 3)) then
				v211.ZIndex = 13 - 7;
				return v211;
			end
		end
	end
	local v142 = v141();
	v142.Visible = true;
	local v144 = v141();
	local function v145(v212, v213, v214)
		local v215 = Instance.new("Frame");
		v215.Parent = v212;
		v215.Position = v214;
		v215.Size = UDim2.new(711 - (530 + 181), 1106 - (614 + 267), 32 - (19 + 13), 55 - 21);
		v215.BackgroundTransparency = 1;
		v215.ZIndex = 7;
		local v221 = Instance.new("TextButton");
		v221.Name = "Btn";
		v221.Parent = v215;
		v221.Size = UDim2.new(2 - 1, 0 - 0, 1 + 0, 0 - 0);
		v221.BackgroundColor3 = v62.BtnBg;
		v221.BorderSizePixel = 0;
		v221.Text = v213;
		v221.TextColor3 = v62.TextMain;
		v221.TextSize = 26 - 13;
		v221.Font = Enum.Font.SourceSansBold;
		v221.ZIndex = 8;
		Instance.new("UICorner", v221).CornerRadius = UDim.new(0, 1818 - (1293 + 519));
		local v236 = Instance.new("UIStroke");
		v236.Color = v62.Border;
		v236.Thickness = 1 - 0;
		v236.Parent = v221;
		v63(v221);
		return v221;
	end
	local function v146(v241, v242)
		local v243 = 0;
		local v244;
		while true do
			if (v243 == (0 - 0)) then
				v244 = v241:FindFirstChildOfClass("UIStroke");
				if v242 then
					local v506 = 0;
					local v507;
					while true do
						if (v506 == 0) then
							v507 = 0 - 0;
							while true do
								if (v507 == (0 - 0)) then
									v241.TextColor3 = v62.Background;
									v241.BackgroundColor3 = v62.AccentWhite;
									v507 = 2 - 1;
								end
								if (v507 == (1 + 0)) then
									if v244 then
										v244.Color = v62.AccentWhite;
									end
									break;
								end
							end
							break;
						end
					end
				else
					local v508 = 0 + 0;
					while true do
						if (v508 == (2 - 1)) then
							if v244 then
								v244.Color = v62.Border;
							end
							break;
						end
						if (v508 == (0 + 0)) then
							v241.TextColor3 = v62.TextMain;
							v241.BackgroundColor3 = v62.BtnBg;
							v508 = 1 + 0;
						end
					end
				end
				break;
			end
		end
	end
	local v147 = v145(v142, "AUTO AIM: OFF", UDim2.new(0.05, 0 + 0, 1096.02 - (709 + 387), 0));
	local v148 = v145(v142, "TRIGGER BOT: OFF", UDim2.new(1858.53 - (673 + 1185), 0, 0.02 - 0, 0 - 0));
	local v149 = v145(v142, "NO RECOIL: OFF", UDim2.new(0.05 - 0, 0, 0.14 + 0, 0 + 0));
	local v150 = v145(v142, "ESP BOX: OFF", UDim2.new(0.53 - 0, 0 + 0, 0.14 - 0, 0 - 0));
	local v151 = v145(v142, "ESP LINE: OFF", UDim2.new(1880.53 - (446 + 1434), 0, 0.26, 1283 - (1040 + 243)));
	local v152 = v145(v142, "ANTI-REPORT: OFF", UDim2.new(0.05, 0 - 0, 1847.26 - (559 + 1288), 0));
	local v153 = v145(v142, "WALL CHECK: OFF", UDim2.new(1931.05 - (609 + 1322), 0, 454.38 - (13 + 441), 0 - 0));
	local v154 = v145(v142, "ESP COLOR: WHITE", UDim2.new(0.53, 0 - 0, 0.38 - 0, 0));
	local v155 = v145(v142, "TARGET BONE: HEAD", UDim2.new(0.53 + 0, 0, 0.5, 0 - 0));
	v153.MouseButton1Click:Connect(function()
		local v245 = 0 + 0;
		while true do
			if (v245 == (1 + 0)) then
				v146(v153, _G.WallCheckEnabled);
				break;
			end
			if (v245 == 0) then
				_G.WallCheckEnabled = not _G.WallCheckEnabled;
				v153.Text = "WALL CHECK: " .. ((_G.WallCheckEnabled and "ON") or "OFF");
				v245 = 2 - 1;
			end
		end
	end);
	v155.MouseButton1Click:Connect(function()
		local v246 = 0 + 0;
		while true do
			if (v246 == (0 - 0)) then
				v40 = v40 + 1 + 0;
				if (v40 > #v39) then
					v40 = 1 + 0;
				end
				v246 = 1;
			end
			if (v246 == (1 + 0)) then
				_G.AimbotTargetBone = v39[v40];
				v155.Text = "TARGET BONE: " .. _G.AimbotTargetBone;
				break;
			end
		end
	end);
	v154.MouseButton1Click:Connect(function()
		local v247 = 0;
		local v248;
		local v249;
		while true do
			if (v247 == (2 + 0)) then
				v154.Text = "ESP COLOR: " .. v248.Name;
				v249 = v154:FindFirstChildOfClass("UIStroke");
				v247 = 3;
			end
			if (v247 == 3) then
				if v249 then
					v249.Color = v248.Color;
				end
				break;
			end
			if (v247 == (0 + 0)) then
				v44 = v44 + (434 - (153 + 280));
				if (v44 > #v43) then
					v44 = 2 - 1;
				end
				v247 = 1 + 0;
			end
			if (v247 == (1 + 0)) then
				v248 = v43[v44];
				_G.ESPColor = v248.Color;
				v247 = 2;
			end
		end
	end);
	local v156 = Instance.new("TextBox");
	v156.Parent = v142;
	v156.Position = UDim2.new(0.05, 0 + 0, 0.5 + 0, 0);
	v156.Size = UDim2.new(0, 225, 0 + 0, 34);
	v156.BackgroundColor3 = v62.BtnBg;
	v156.BorderSizePixel = 0 - 0;
	v156.PlaceholderText = "Nama target...";
	v156.PlaceholderColor3 = v62.TextDark;
	v156.Text = "";
	v156.TextColor3 = v62.TextMain;
	v156.TextSize = 13;
	v156.Font = Enum.Font.SourceSans;
	v156.ZIndex = 7;
	Instance.new("UICorner", v156).CornerRadius = UDim.new(0 + 0, 5);
	local v174 = Instance.new("UIStroke");
	v174.Color = v62.Border;
	v174.Thickness = 668 - (89 + 578);
	v174.Parent = v156;
	local v178 = v145(v142, "PILIH TARGET", UDim2.new(0.53 + 0, 0 - 0, 1049.62 - (572 + 477), 0));
	local v179 = v145(v142, "SHADOW LOCK: OFF", UDim2.new(0.05 + 0, 0 + 0, 0.62 + 0, 86 - (84 + 2)));
	local v180 = v145(v142, "ANTI AIMBOT: OFF", UDim2.new(0.05, 0, 0.74 - 0, 0 + 0));
	local v181 = v145(v144, "FPS BOOST: OFF", UDim2.new(842.5 - (497 + 345), -(3 + 109), 0.12 + 0, 1333 - (605 + 728)));
	local v182 = "Main";
	local v183 = {Main=v142,Boost=v144};
	local function v184(v250)
		local v251 = 0 + 0;
		local v252;
		local v253;
		while true do
			if (v251 == 0) then
				if (v182 == v250) then
					return;
				end
				v252 = v183[v182];
				v251 = 1 - 0;
			end
			if (3 == v251) then
				v253.Visible = true;
				break;
			end
			if (v251 == 2) then
				for v477, v478 in pairs(v136) do
					v478.TextColor3 = ((v477 == v250) and v62.AccentWhite) or v62.TextDark;
				end
				v252.Visible = false;
				v251 = 3;
			end
			if (v251 == 1) then
				local v457 = 0;
				while true do
					if (v457 == 1) then
						v251 = 1 + 1;
						break;
					end
					if (v457 == 0) then
						v253 = v183[v250];
						v182 = v250;
						v457 = 3 - 2;
					end
				end
			end
		end
	end
	v138.MouseButton1Click:Connect(function()
		v184("Main");
	end);
	v139.MouseButton1Click:Connect(function()
		v184("Boost");
	end);
	v152.MouseButton1Click:Connect(function()
		local v254 = 0 + 0;
		while true do
			if (v254 == (2 - 1)) then
				v146(v152, _G.AntiReport);
				break;
			end
			if (v254 == (0 + 0)) then
				_G.AntiReport = not _G.AntiReport;
				v152.Text = "ANTI-REPORT: " .. ((_G.AntiReport and "ON") or "OFF");
				v254 = 1;
			end
		end
	end);
	local function v185(v255, v256)
		if (_G.AntiReport and (v255 ~= v2)) then
			local v420 = 489 - (457 + 32);
			local v421;
			while true do
				if (v420 == (0 + 0)) then
					v421 = v256:lower();
					if (v421:find("report") or v421:find("cheat") or v421:find("hacker")) then
						v2:Kick("Anti-Report: Threat detected in chat log.");
					end
					break;
				end
			end
		end
	end
	for v257, v258 in pairs(v1:GetPlayers()) do
		v258.Chatted:Connect(function(v296)
			v185(v258, v296);
		end);
	end
	v1.PlayerAdded:Connect(function(v259)
		pcall(function()
			v259.Chatted:Connect(function(v422)
				v185(v259, v422);
			end);
		end);
	end);
	v149.MouseButton1Click:Connect(function()
		local v260 = 1402 - (832 + 570);
		while true do
			if (v260 == (0 + 0)) then
				_G.NoRecoil = not _G.NoRecoil;
				v149.Text = "NO RECOIL: " .. ((_G.NoRecoil and "ON") or "OFF");
				v260 = 1;
			end
			if (v260 == 1) then
				v146(v149, _G.NoRecoil);
				if _G.NoRecoil then
					local v511 = 0 + 0;
					while true do
						if (v511 == 0) then
							v53[3 - 2] = v33.RenderStepped:Connect(function()
								local v612 = 0;
								local v613;
								while true do
									if (v612 == (0 + 0)) then
										v613 = v2.Character and v2.Character:FindFirstChildOfClass("Tool");
										if (v613 and v613:FindFirstChild("Recoil")) then
											v613.Recoil.Enabled = false;
										end
										break;
									end
								end
							end);
							v53[2] = v33.Heartbeat:Connect(function()
								pcall(function()
									if v32 then
										v32.FieldOfView = 866 - (588 + 208);
									end
								end);
							end);
							break;
						end
					end
				else
					local v512 = 0 - 0;
					local v513;
					while true do
						if (v512 == (1800 - (884 + 916))) then
							v513 = 0;
							while true do
								if (v513 == (0 - 0)) then
									for v645, v646 in pairs(v53) do
										if v646 then
											v646:Disconnect();
										end
									end
									v53 = {};
									break;
								end
							end
							break;
						end
					end
				end
				break;
			end
		end
	end);
	local function v186(v261)
		if (not v261 or (v261 == v2)) then
			return false;
		end
		local v262 = v38:GetTeams();
		if (#v262 > 0) then
			local v423 = 0 + 0;
			while true do
				if (v423 == (653 - (232 + 421))) then
					if (v2.Team and v261.Team) then
						if (v2.Team == v261.Team) then
							return false;
						end
					end
					if (v2.TeamColor and v261.TeamColor) then
						if (v2.TeamColor == v261.TeamColor) then
							return false;
						end
					end
					break;
				end
			end
		end
		local v263 = v2:FindFirstChild("leaderstats") or v2:FindFirstChild("PlayerGui");
		local v264 = v261:FindFirstChild("leaderstats");
		if (v263 and v264) then
			local v424 = 1889 - (1569 + 320);
			local v425;
			local v426;
			while true do
				if (v424 == 1) then
					if (v425 and v426 and (v425.Value == v426.Value) and (v425.Value ~= "")) then
						return false;
					end
					break;
				end
				if (v424 == (0 + 0)) then
					v425 = v263:FindFirstChild("Team") or v263:FindFirstChild("Faction");
					v426 = v264:FindFirstChild("Team") or v264:FindFirstChild("Faction");
					v424 = 1 + 0;
				end
			end
		end
		return true;
	end
	v148.MouseButton1Click:Connect(function()
		local v265 = 0 - 0;
		while true do
			if (v265 == (605 - (316 + 289))) then
				_G.TriggerBot = not _G.TriggerBot;
				v148.Text = "TRIGGER BOT: " .. ((_G.TriggerBot and "ON") or "OFF");
				v265 = 2 - 1;
			end
			if (v265 == (1 + 0)) then
				v146(v148, _G.TriggerBot);
				break;
			end
		end
	end);
	local function v187()
		local v266 = 0;
		local v267;
		while true do
			if (v266 == 0) then
				if not _G.TriggerBot then
					return;
				end
				v267 = Vector2.new(v32.ViewportSize.X / 2, v32.ViewportSize.Y / (1455 - (666 + 787)));
				v266 = 426 - (360 + 65);
			end
			if (v266 == 1) then
				for v480, v481 in pairs(v1:GetPlayers()) do
					if ((v481 ~= v2) and v481.Character and v481.Character:FindFirstChild("Head") and v481.Character:FindFirstChild("Humanoid") and v186(v481)) then
						if (v481.Character.Humanoid.Health <= (0 + 0)) then
							continue;
						end
						local v542 = v481.Character.Head;
						local v543, v544 = v32:WorldToViewportPoint(v542.Position);
						if v544 then
							local v581 = (Vector2.new(v543.X, v543.Y) - v267).Magnitude;
							if (v581 <= (334 - (79 + 175))) then
								if ((tick() - v54) >= _G.TriggerBotDelay) then
									local v647 = 0;
									local v648;
									while true do
										if (v647 == (0 - 0)) then
											v648 = 0;
											while true do
												if (v648 == (0 + 0)) then
													v37:SendMouseButtonEvent(v32.ViewportSize.X / 2, v32.ViewportSize.Y / 2, 0, true, game, 0);
													task.wait(0.04);
													v648 = 1;
												end
												if (v648 == 1) then
													v37:SendMouseButtonEvent(v32.ViewportSize.X / 2, v32.ViewportSize.Y / 2, 0, false, game, 0 - 0);
													v54 = tick();
													break;
												end
											end
											break;
										end
									end
								end
								break;
							end
						end
					end
				end
				break;
			end
		end
	end
	local function v188(v268, v269)
		if not v268 then
			return nil;
		end
		local v270 = v268:FindFirstChild("Head");
		local v271 = v268:FindFirstChild("HumanoidRootPart");
		if (v269 == "HEAD") then
			local v427 = 0;
			while true do
				if (v427 == (0 - 0)) then
					if v270 then
						return v270;
					end
					for v545, v546 in pairs(v268:GetChildren()) do
						if (v546:IsA("BasePart") and v546.Name:lower():find("head")) then
							return v546;
						end
					end
					break;
				end
			end
		elseif (v269 == "TORSO") then
			for v514, v515 in pairs({"uppertorso","torso","lowertorso","chest","abs"}) do
				local v516 = v268:FindFirstChild(v515) or v268:FindFirstChild(v515:sub(1 + 0, 1 + 0):upper() .. v515:sub(2));
				if v516 then
					return v516;
				end
			end
			for v517, v518 in pairs(v268:GetChildren()) do
				if (v518:IsA("BasePart") and (v518.Name:lower():find("torso") or v518.Name:lower():find("chest"))) then
					return v518;
				end
			end
			if v271 then
				return v271;
			end
		elseif (v269 == "LEGS") then
			local v547 = 0 - 0;
			while true do
				if (v547 == (1 + 0)) then
					if v271 then
						return v271;
					end
					break;
				end
				if (v547 == (0 - 0)) then
					for v622, v623 in pairs({"leftlowerleg","rightlowerleg","leftleg","rightleg","lowerleg","foot"}) do
						local v624 = 0 + 0;
						local v625;
						while true do
							if (v624 == (0 - 0)) then
								v625 = v268:FindFirstChild(v623) or v268:FindFirstChild(v623:sub(1, 1):upper() .. v623:sub(2));
								if v625 then
									return v625;
								end
								break;
							end
						end
					end
					for v626, v627 in pairs(v268:GetChildren()) do
						if (v627:IsA("BasePart") and (v627.Name:lower():find("leg") or v627.Name:lower():find("foot"))) then
							return v627;
						end
					end
					v547 = 1245 - (485 + 759);
				end
			end
		end
		return v270 or v271;
	end
	local function v189(v272)
		local v273 = 0;
		local v274;
		local v275;
		local v276;
		local v277;
		local v278;
		while true do
			local v297 = 0 - 0;
			while true do
				if ((1189 - (442 + 747)) == v297) then
					if (v273 == (1137 - (832 + 303))) then
						v277.IgnoreWater = true;
						v278 = workspace:Raycast(v275, v276, v277);
						return v278 == nil;
					end
					if (v273 == 0) then
						if not _G.WallCheckEnabled then
							return true;
						end
						v274 = v2.Character;
						if (not v274 or not v274:FindFirstChild("Head")) then
							return false;
						end
						v275 = v32.CFrame.Position;
						v273 = 947 - (88 + 858);
					end
					v297 = 1;
				end
				if (v297 == (1 + 0)) then
					if ((1 + 0) == v273) then
						v276 = v272.Position - v275;
						v277 = RaycastParams.new();
						v277.FilterType = Enum.RaycastFilterType.Exclude;
						v277.FilterDescendantsInstances = {v274,v272.Parent};
						v273 = 791 - (766 + 23);
					end
					break;
				end
			end
		end
	end
	function StartShadowLock()
		local v279 = 0 - 0;
		local v280;
		while true do
			if (v279 == 0) then
				if v55 then
					v55:Disconnect();
				end
				if v56 then
					v56:Disconnect();
				end
				v279 = 1 - 0;
			end
			if (v279 == (4 - 2)) then
				v55 = v33.RenderStepped:Connect(function()
					local v482 = 0 - 0;
					local v483;
					local v484;
					local v485;
					local v486;
					local v487;
					while true do
						if (v482 == (1076 - (1036 + 37))) then
							v486 = v485.Position;
							v487 = v486 + Vector3.new(math.sin(tick() * 5) * (3 + 1), (math.cos(tick() * (13 - 6)) * (1.5 + 0)) + 3, math.cos(tick() * (1485 - (641 + 839))) * 4);
							v482 = 4;
						end
						if (v482 == (917 - (910 + 3))) then
							v484.Velocity = (v487 - v484.Position) * 10;
							v484.CFrame = CFrame.new(v484.Position, Vector3.new(v486.X, v484.Position.Y, v486.Z));
							break;
						end
						if (v482 == (4 - 2)) then
							v485 = v188(_G.ShadowTarget.Character, _G.AimbotTargetBone);
							if not v485 then
								local v614 = 0;
								while true do
									if (v614 == (1684 - (1466 + 218))) then
										StopShadowLock();
										return;
									end
								end
							end
							v482 = 2 + 1;
						end
						if (v482 == (1149 - (556 + 592))) then
							v484 = v483 and v483:FindFirstChild("HumanoidRootPart");
							if not v484 then
								local v615 = 0;
								local v616;
								while true do
									if (v615 == (0 + 0)) then
										v616 = 0;
										while true do
											if (v616 == 0) then
												StopShadowLock();
												return;
											end
										end
										break;
									end
								end
							end
							v482 = 2;
						end
						if (v482 == (808 - (329 + 479))) then
							if (not _G.ShadowLockEnabled or not _G.ShadowTarget or not _G.ShadowTarget.Character) then
								local v617 = 854 - (174 + 680);
								while true do
									if (v617 == (0 - 0)) then
										StopShadowLock();
										return;
									end
								end
							end
							v483 = v2.Character;
							v482 = 1 - 0;
						end
					end
				end);
				v56 = v33.Stepped:Connect(function()
					local v488 = v2.Character;
					if (v488 and _G.ShadowLockEnabled) then
						for v564, v565 in pairs(v488:GetChildren()) do
							if v565:IsA("BasePart") then
								v565.CanCollide = false;
							end
						end
					end
				end);
				break;
			end
			if (v279 == 1) then
				local v461 = 0;
				while true do
					if (v461 == 1) then
						v279 = 2 + 0;
						break;
					end
					if (v461 == (739 - (396 + 343))) then
						v280 = v2.Character;
						if (v280 and v280:FindFirstChild("Humanoid")) then
							local v582 = 0 + 0;
							local v583;
							while true do
								if (v582 == (1477 - (29 + 1448))) then
									v583 = 1389 - (135 + 1254);
									while true do
										if (v583 == (0 - 0)) then
											v280.Humanoid.PlatformStand = true;
											v280.Humanoid.AutoRotate = false;
											break;
										end
									end
									break;
								end
							end
						end
						v461 = 1;
					end
				end
			end
		end
	end
	function StopShadowLock()
		local v281 = 0;
		local v282;
		while true do
			if (v281 == (9 - 7)) then
				if v282 then
					local v519 = 0 + 0;
					local v520;
					while true do
						if (v519 == (1527 - (389 + 1138))) then
							v520 = 574 - (102 + 472);
							while true do
								if (v520 == (0 + 0)) then
									if v282:FindFirstChild("Humanoid") then
										v282.Humanoid.PlatformStand = false;
										v282.Humanoid.AutoRotate = true;
									end
									for v649, v650 in pairs(v282:GetChildren()) do
										if v650:IsA("BasePart") then
											v650.CanCollide = true;
										end
									end
									break;
								end
							end
							break;
						end
					end
				end
				break;
			end
			if (v281 == 0) then
				_G.ShadowLockEnabled = false;
				if v55 then
					local v521 = 0 + 0;
					while true do
						if (v521 == (0 + 0)) then
							v55:Disconnect();
							v55 = nil;
							break;
						end
					end
				end
				v281 = 1546 - (320 + 1225);
			end
			if ((1 - 0) == v281) then
				if v56 then
					local v522 = 0 + 0;
					while true do
						if ((1464 - (157 + 1307)) == v522) then
							v56:Disconnect();
							v56 = nil;
							break;
						end
					end
				end
				v282 = v2.Character;
				v281 = 1861 - (821 + 1038);
			end
		end
	end
	local function v190()
		local v283 = 0 - 0;
		while true do
			if ((1 + 2) == v283) then
				for v489, v490 in pairs(v1:GetPlayers()) do
					if (v490.Character and v490.Character:FindFirstChild("AMBA_ESP")) then
						pcall(function()
							v490.Character.AMBA_ESP:Destroy();
						end);
					end
				end
				break;
			end
			if (v283 == (3 - 1)) then
				for v491, v492 in pairs(v51) do
					pcall(function()
						v492:Remove();
					end);
				end
				v51 = {};
				for v493, v494 in pairs(v52) do
					pcall(function()
						v494:Remove();
					end);
				end
				v52 = {};
				v283 = 2 + 1;
			end
			if (v283 == 1) then
				for v495, v496 in pairs(v49) do
					pcall(function()
						v496:Remove();
					end);
				end
				v49 = {};
				for v497, v498 in pairs(v50) do
					pcall(function()
						v498:Remove();
					end);
				end
				v50 = {};
				v283 = 4 - 2;
			end
			if (v283 == 0) then
				for v499, v500 in pairs(v47) do
					pcall(function()
						v500:Remove();
					end);
				end
				v47 = {};
				for v501, v502 in pairs(v48) do
					pcall(function()
						v502:Remove();
					end);
				end
				v48 = {};
				v283 = 1027 - (834 + 192);
			end
		end
	end
	v150.MouseButton1Click:Connect(function()
		_G.ESPEnabled = not _G.ESPEnabled;
		v150.Text = "ESP BOX: " .. ((_G.ESPEnabled and "ON") or "OFF");
		v146(v150, _G.ESPEnabled);
		if (not _G.ESPEnabled and not _G.ESPLineEnabled) then
			v190();
		end
	end);
	v151.MouseButton1Click:Connect(function()
		local v285 = 0 + 0;
		while true do
			if (v285 == (1 + 0)) then
				v146(v151, _G.ESPLineEnabled);
				if (not _G.ESPEnabled and not _G.ESPLineEnabled) then
					v190();
				end
				break;
			end
			if ((0 + 0) == v285) then
				_G.ESPLineEnabled = not _G.ESPLineEnabled;
				v151.Text = "ESP LINE: " .. ((_G.ESPLineEnabled and "ON") or "OFF");
				v285 = 1 - 0;
			end
		end
	end);
	v147.MouseButton1Click:Connect(function()
		local v286 = 0;
		local v287;
		while true do
			if (v286 == (304 - (300 + 4))) then
				v287 = 0 + 0;
				while true do
					if (v287 == (0 - 0)) then
						_G.AimbotEnabled = not _G.AimbotEnabled;
						v147.Text = "AUTO AIM: " .. ((_G.AimbotEnabled and "ON") or "OFF");
						v287 = 1;
					end
					if (v287 == (363 - (112 + 250))) then
						v146(v147, _G.AimbotEnabled);
						if not _G.AimbotEnabled then
							v42 = nil;
						end
						break;
					end
				end
				break;
			end
		end
	end);
	v178.MouseButton1Click:Connect(function()
		local v288 = v156.Text;
		if (v288 == "") then
			v178.Text = "MASUKKAN NAMA!";
			task.wait(1 + 0);
			v178.Text = "PILIH TARGET";
			return;
		end
		local v289 = false;
		for v298, v299 in pairs(v1:GetPlayers()) do
			if ((v299 ~= v2) and v299.Name:lower():find(v288:lower())) then
				_G.ShadowTarget = v299;
				if v299.Character then
					local v523 = v188(v299.Character, _G.AimbotTargetBone);
					if v523 then
						v42 = v523;
					else
						v42 = v299.Character:FindFirstChild("HumanoidRootPart");
					end
				else
					task.spawn(function()
						repeat
							task.wait(0.5);
						until v299.Character 
						local v556 = v188(v299.Character, _G.AimbotTargetBone);
						v42 = v556 or v299.Character:FindFirstChild("HumanoidRootPart");
					end);
				end
				v178.Text = v299.Name:upper();
				v289 = true;
				break;
			end
		end
		if not v289 then
			v178.Text = "GAK KETEMU!";
			task.wait(2 - 1);
			v178.Text = "PILIH TARGET";
		end
	end);
	v179.MouseButton1Click:Connect(function()
		local v290 = 0;
		while true do
			if (v290 == (2 + 0)) then
				if _G.ShadowLockEnabled then
					StartShadowLock();
				else
					StopShadowLock();
				end
				break;
			end
			if (v290 == (1 + 0)) then
				v179.Text = "SHADOW LOCK: " .. ((_G.ShadowLockEnabled and "ON") or "OFF");
				v146(v179, _G.ShadowLockEnabled);
				v290 = 2;
			end
			if (v290 == 0) then
				if not _G.ShadowTarget then
					return;
				end
				_G.ShadowLockEnabled = not _G.ShadowLockEnabled;
				v290 = 1 + 0;
			end
		end
	end);
	v33.RenderStepped:Connect(function()
		v187();
		local v291 = v35:GetMouseLocation();
		if _G.AimbotEnabled then
			if (_G.ShadowLockEnabled and _G.ShadowTarget and _G.ShadowTarget.Character) then
				local v503 = 0;
				local v504;
				while true do
					if ((0 + 0) == v503) then
						v504 = v188(_G.ShadowTarget.Character, _G.AimbotTargetBone);
						if v504 then
							v32.CFrame = CFrame.new(v32.CFrame.Position, v504.Position);
						end
						break;
					end
				end
			elseif v35:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
				local v557 = false;
				if (v42 and v42.Parent) then
					local v584 = 0;
					local v585;
					local v586;
					while true do
						if (v584 == (1 + 0)) then
							if (v586 and (v586.Health > (1414 - (1001 + 413)))) then
								local v685 = 0;
								local v686;
								while true do
									if ((0 - 0) == v685) then
										v686 = v1:GetPlayerFromCharacter(v585);
										if (v686 and v186(v686) and v189(v42)) then
											v557 = true;
										end
										break;
									end
								end
							end
							break;
						end
						if (v584 == (882 - (244 + 638))) then
							local v635 = 693 - (627 + 66);
							while true do
								if (0 == v635) then
									v585 = v42.Parent;
									v586 = v585:FindFirstChild("Humanoid");
									v635 = 2 - 1;
								end
								if (v635 == (603 - (512 + 90))) then
									v584 = 1;
									break;
								end
							end
						end
					end
				end
				if not v557 then
					if (v42 == nil) then
						local v628 = _G.CircleRadius;
						local v629 = nil;
						for v636, v637 in pairs(v1:GetPlayers()) do
							if ((v637 ~= v2) and v637.Character and v637.Character:FindFirstChild("Humanoid")) then
								local v687 = 1906 - (1665 + 241);
								local v688;
								while true do
									if (v687 == 1) then
										if (v688.Health > (717 - (373 + 344))) then
											local v731 = v188(v637.Character, _G.AimbotTargetBone);
											if (v731 and v189(v731)) then
												local v733, v734 = v32:WorldToViewportPoint(v731.Position);
												if v734 then
													local v751 = 0 + 0;
													local v752;
													while true do
														if (v751 == (0 + 0)) then
															v752 = (Vector2.new(v733.X, v733.Y) - v291).Magnitude;
															if (v752 < v628) then
																local v754 = 0 - 0;
																while true do
																	if (v754 == (0 - 0)) then
																		v628 = v752;
																		v629 = v731;
																		break;
																	end
																end
															end
															break;
														end
													end
												end
											end
										end
										break;
									end
									if (v687 == (1099 - (35 + 1064))) then
										if not v186(v637) then
											continue;
										end
										v688 = v637.Character.Humanoid;
										v687 = 1 + 0;
									end
								end
							end
						end
						v42 = v629;
					else
						v42 = nil;
					end
				end
				if (v42 and v42.Parent) then
					local v587 = 0 - 0;
					local v588;
					local v589;
					local v590;
					while true do
						if (v587 == 1) then
							v590 = nil;
							while true do
								if (v588 == 1) then
									if (v590 and (v590.Health > 0)) then
										local v708 = v1:GetPlayerFromCharacter(v589);
										if (v708 and v186(v708) and v189(v42)) then
											v32.CFrame = CFrame.new(v32.CFrame.Position, v42.Position);
										else
											v42 = nil;
										end
									else
										v42 = nil;
									end
									break;
								end
								if ((0 + 0) == v588) then
									local v694 = 0;
									while true do
										if (v694 == 1) then
											v588 = 1;
											break;
										end
										if (v694 == (1236 - (298 + 938))) then
											v589 = v42.Parent;
											v590 = v589:FindFirstChild("Humanoid");
											v694 = 1;
										end
									end
								end
							end
							break;
						end
						if ((1259 - (233 + 1026)) == v587) then
							v588 = 0;
							v589 = nil;
							v587 = 1667 - (636 + 1030);
						end
					end
				end
			else
				v42 = nil;
			end
		end
		for v300, v301 in pairs(v1:GetPlayers()) do
			local v302 = v48[v301];
			local v303 = v47[v301];
			local v304 = v49[v301];
			local v305 = v50[v301];
			local v306 = v51[v301];
			local v307 = v52[v301];
			if (v301.Character and v301.Character:FindFirstChild("HumanoidRootPart") and v301.Character:FindFirstChild("Humanoid")) then
				local v466 = v301.Character.HumanoidRootPart;
				local v467 = v301.Character.Humanoid;
				if ((v467.Health > 0) and v186(v301)) then
					local v524, v525 = v32:WorldToViewportPoint(v466.Position);
					if v525 then
						local v566 = 0 + 0;
						local v567;
						local v568;
						local v569;
						local v570;
						local v571;
						while true do
							if (v566 == (0 + 0)) then
								v567, v568 = (743 + 1757) / v524.Z, 4000 / v524.Z;
								v569, v570 = v524.X - (v567 / (1 + 1)), v524.Y - (v568 / (223 - (55 + 166)));
								v566 = 1 + 0;
							end
							if (v566 == (1 + 1)) then
								if _G.ESPEnabled then
									if not v302 then
										local v695 = 0 - 0;
										while true do
											if (v695 == (297 - (36 + 261))) then
												v48[v301] = Drawing.new("Square");
												v302 = v48[v301];
												v695 = 1;
											end
											if (v695 == (1 - 0)) then
												v302.Thickness = 1;
												v302.Filled = false;
												break;
											end
										end
									end
									v302.Color = _G.ESPColor;
									v302.Size = Vector2.new(v567, v568);
									v302.Position = Vector2.new(v569, v570);
									v302.Visible = true;
									if not v304 then
										local v696 = 0;
										while true do
											if (v696 == 0) then
												v49[v301] = Drawing.new("Text");
												v304 = v49[v301];
												v696 = 1369 - (34 + 1334);
											end
											if (v696 == 1) then
												v304.Size = 5 + 8;
												v304.Center = true;
												v696 = 2 + 0;
											end
											if (v696 == (1285 - (1035 + 248))) then
												v304.Outline = true;
												break;
											end
										end
									end
									v304.Color = v62.AccentWhite;
									v304.Text = v301.Name;
									v304.Position = Vector2.new(v524.X, v570 - 16);
									v304.Visible = true;
									if not v305 then
										local v697 = 0;
										while true do
											if (v697 == 2) then
												v305.Outline = true;
												break;
											end
											if (v697 == 0) then
												v50[v301] = Drawing.new("Text");
												v305 = v50[v301];
												v697 = 22 - (20 + 1);
											end
											if (v697 == 1) then
												v305.Size = 7 + 5;
												v305.Center = true;
												v697 = 321 - (134 + 185);
											end
										end
									end
									v305.Color = v62.TextDark;
									v305.Text = "[" .. v571 .. " Studs]";
									v305.Position = Vector2.new(v524.X, v570 + v568 + (1135 - (549 + 584)));
									v305.Visible = true;
									if not v307 then
										local v698 = 685 - (314 + 371);
										while true do
											if (v698 == (3 - 2)) then
												v307.Thickness = 969 - (478 + 490);
												v307.Filled = true;
												v698 = 2 + 0;
											end
											if (v698 == (1172 - (786 + 386))) then
												v52[v301] = Drawing.new("Square");
												v307 = v52[v301];
												v698 = 3 - 2;
											end
											if (v698 == 2) then
												v307.Color = Color3.fromRGB(1379 - (1055 + 324), 1340 - (1093 + 247), 0);
												break;
											end
										end
									end
									v307.Size = Vector2.new(4, v568);
									v307.Position = Vector2.new(v569 - (6 + 0), v570);
									v307.Visible = true;
									if not v306 then
										local v699 = 0 + 0;
										local v700;
										while true do
											if (v699 == 0) then
												v700 = 0;
												while true do
													if (v700 == (0 - 0)) then
														v51[v301] = Drawing.new("Square");
														v306 = v51[v301];
														v700 = 3 - 2;
													end
													if (v700 == (2 - 1)) then
														v306.Thickness = 1;
														v306.Filled = true;
														break;
													end
												end
												break;
											end
										end
									end
									local v669 = math.clamp(v467.Health / v467.MaxHealth, 0, 1);
									v306.Color = Color3.fromRGB(255 - ((640 - 385) * v669), 255 * v669, 0 + 0);
									v306.Size = Vector2.new(7 - 5, v568 * v669);
									v306.Position = Vector2.new(v569 - (17 - 12), v570 + (v568 * ((1 + 0) - v669)));
									v306.Visible = true;
									local v674 = v301.Character:FindFirstChild("AMBA_ESP");
									if not v674 then
										local v701 = 0;
										local v702;
										while true do
											if (0 == v701) then
												v702 = 0;
												while true do
													if (v702 == 1) then
														v674.FillTransparency = 0.6;
														v674.OutlineTransparency = 0.3 - 0;
														v702 = 690 - (364 + 324);
													end
													if ((0 - 0) == v702) then
														v674 = Instance.new("Highlight");
														v674.Name = "AMBA_ESP";
														v702 = 2 - 1;
													end
													if (v702 == (1 + 1)) then
														v674.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
														v674.Parent = v301.Character;
														break;
													end
												end
												break;
											end
										end
									end
									v674.FillColor = _G.ESPColor;
									v674.OutlineColor = _G.ESPColor;
								else
									local v677 = 0 - 0;
									local v678;
									while true do
										if (v677 == (0 - 0)) then
											v678 = 0 - 0;
											while true do
												if (v678 == (1270 - (1249 + 19))) then
													if v307 then
														v307.Visible = false;
													end
													if (v301.Character and v301.Character:FindFirstChild("AMBA_ESP")) then
														pcall(function()
															v301.Character.AMBA_ESP:Destroy();
														end);
													end
													break;
												end
												if (0 == v678) then
													if v302 then
														v302.Visible = false;
													end
													if v304 then
														v304.Visible = false;
													end
													v678 = 1 + 0;
												end
												if ((3 - 2) == v678) then
													if v305 then
														v305.Visible = false;
													end
													if v306 then
														v306.Visible = false;
													end
													v678 = 1088 - (686 + 400);
												end
											end
											break;
										end
									end
								end
								continue;
								break;
							end
							if (v566 == 1) then
								local v630 = 0 + 0;
								while true do
									if (1 == v630) then
										v566 = 2;
										break;
									end
									if (v630 == (229 - (73 + 156))) then
										v571 = math.floor((v2.Character and v2.Character:FindFirstChild("HumanoidRootPart") and (v466.Position - v2.Character.HumanoidRootPart.Position).Magnitude) or 0);
										if _G.ESPLineEnabled then
											if not v303 then
												v47[v301] = Drawing.new("Line");
												v303 = v47[v301];
												v303.Thickness = 1;
											end
											v303.Color = _G.ESPColor;
											v303.From = Vector2.new(v32.ViewportSize.X / (1 + 1), v32.ViewportSize.Y - 15);
											v303.To = Vector2.new(v524.X, v524.Y);
											v303.Visible = true;
										elseif v303 then
											v303.Visible = false;
										end
										v630 = 1;
									end
								end
							end
						end
					end
				end
			end
			if v303 then
				v303.Visible = false;
			end
			if v302 then
				v302.Visible = false;
			end
			if v304 then
				v304.Visible = false;
			end
			if v305 then
				v305.Visible = false;
			end
			if v306 then
				v306.Visible = false;
			end
			if v307 then
				v307.Visible = false;
			end
			if (v301.Character and v301.Character:FindFirstChild("AMBA_ESP")) then
				pcall(function()
					v301.Character.AMBA_ESP:Destroy();
				end);
			end
		end
	end);
	local v191 = Instance.new("TextButton");
	v191.Parent = v113;
	v191.Position = UDim2.new(812 - (721 + 90), -42, 0 + 0, 35 - 24);
	v191.Size = UDim2.new(470 - (224 + 246), 44 - 16, 0, 51 - 23);
	v191.BackgroundTransparency = 1 + 0;
	v191.Text = "—";
	v191.TextColor3 = v62.TextDark;
	v191.TextSize = 1 + 13;
	v191.Font = Enum.Font.SourceSansBold;
	v191.ZIndex = 8 + 2;
	v191.MouseButton1Click:Connect(function()
		local v292 = 0 - 0;
		while true do
			if (v292 == (0 - 0)) then
				v91.Visible = false;
				v64.Visible = true;
				break;
			end
		end
	end);
	v73.MouseButton1Click:Connect(function()
		local v293 = 0;
		local v294;
		while true do
			if (v293 == (513 - (203 + 310))) then
				v294 = 1993 - (1238 + 755);
				while true do
					if ((0 + 0) == v294) then
						v64.Visible = false;
						v91.Visible = true;
						break;
					end
				end
				break;
			end
		end
	end);
	print("AMBA.HUB V20 LOADED - AIMBOT FINAL FIXED (NO AUTO-SWITCH)");
end
v6(v7);
