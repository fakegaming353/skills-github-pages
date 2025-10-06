pcall(function()
    setfflag("FFlagDisablePostFx", "True")
    setfflag("DFIntTaskSchedulerTargetFps", "240")
    setfflag("DFIntTextureQualityOverride", "0")
    setfflag("DFFlagTextureQualityOverrideEnabled", "True")
    setfflag("FFlagDebugDisplayFPS", "True")
    setfflag("FFlagOptimizeNetwork", "True")
    setfflag("DFIntServerTickRate", "60")
    setfflag("DFIntPerformanceControlFrameTimeMax", "1")
    setfflag("DFIntAnimatorThrottleMaxFramesToSkip", "1")
end)

local gui = Instance.new("ScreenGui")
gui.Name = "FPSCounter"
gui.Parent = game:GetService("CoreGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 120, 0, 28)
label.Position = UDim2.new(0, 12, 0, 12)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(0, 1, 0)
label.Font = Enum.Font.SourceSansBold
label.TextSize = 18
label.Text = "FPS: --"
label.Parent = gui

local RunService = game:GetService("RunService")
local frames = 0
local last = tick()

RunService.RenderStepped:Connect(function()
    frames = frames + 1
    local now = tick()
    if now - last >= 1 then
        local fps = frames / (now - last)
        label.Text = string.format("FPS: %d", fps)
        frames = 0
        last = now
    end
end)
