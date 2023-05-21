-- Configuration

local espColor = Color3.fromRGB(255, 0, 0) -- Change this to the desired color for the ESP

local espTransparency = 0.5 -- Change this to the desired transparency for the ESP

local espThickness = 0.1 -- Change this to the desired thickness for the ESP lines

-- Create ESP for all players

local function createPlayerESP(player)

    -- Create ESP BillboardGui

    local espGui = Instance.new("BillboardGui")

    espGui.Adornee = player.Character.HumanoidRootPart

    espGui.Name = "PlayerESP"

    espGui.Size = UDim2.new(1, 0, 1, 0) -- Set the size to match the player's size

    espGui.StudsOffset = Vector3.new(0, 2, 0)

    espGui.AlwaysOnTop = true

    espGui.Enabled = true

    espGui.Parent = player.Character

    -- Create ESP Frame

    local espFrame = Instance.new("Frame")

    espFrame.Name = "ESPFrame"

    espFrame.BackgroundTransparency = 1

    espFrame.Size = UDim2.new(1, 0, 1, 0)

    espFrame.Parent = espGui

    -- Create ESP Lines

    local leftLine = Instance.new("Frame")

    leftLine.Name = "LeftLine"

    leftLine.AnchorPoint = Vector2.new(1, 0.5)

    leftLine.BackgroundColor3 = espColor

    leftLine.BorderSizePixel = 0

    leftLine.Position = UDim2.new(0.5, -1, 0.5, 0)

    leftLine.Size = UDim2.new(0, espThickness, 1, 0) -- Set the size to match the player's height

    leftLine.Parent = espFrame

    local rightLine = leftLine:Clone()

    rightLine.Name = "RightLine"

    rightLine.AnchorPoint = Vector2.new(0, 0.5)

    rightLine.Position = UDim2.new(0.5, 1, 0.5, 0)

    rightLine.Parent = espFrame

    local topLine = leftLine:Clone()

    topLine.Name = "TopLine"

    topLine.AnchorPoint = Vector2.new(0.5, 1)

    topLine.Position = UDim2.new(0.5, 0, 0, -1) -- Set the position to the top of the frame

    topLine.Size = UDim2.new(1, 0, 0, espThickness) -- Set the size to match the player's width

    topLine.Parent = espFrame

    local bottomLine = topLine:Clone()

    bottomLine.Name = "BottomLine"

    bottomLine.AnchorPoint = Vector2.new(0.5, 0)

    bottomLine.Position = UDim2.new(0.5, 0, 1, 1) -- Set the position to the bottom of the frame

    bottomLine.Parent = espFrame

    -- Update ESP color and transparency

    local function updateESP()

        espFrame.LeftLine.BackgroundColor3 = espColor

        espFrame.LeftLine.BackgroundTransparency = espTransparency

        espFrame.RightLine.BackgroundColor3 = espColor

        espFrame.RightLine.BackgroundTransparency = espTransparency

        espFrame.TopLine.BackgroundColor3 = espColor

        espFrame.TopLine.BackgroundTransparency = espTransparency

        espFrame.BottomLine.BackgroundColor3 = espColor

        espFrame.BottomLine.BackgroundTransparency = espTransparency

    end

    -- Connect ESP color and transparency updates

    espColor.Changed:Connect(updateESP)

    espTransparency.Changed:Connect(updateESP)

end

-- Remove ESP for a player

local function removePlayerESP(player)

    local espGui = player.Character:FindFirstChild("PlayerESP")

    if espGui then

        espGui:Destroy()

    end

end

-- Create ESP for existing players

for _, player in ipairs(game.Players:GetPlayers()) do

    createPlayerESP(player)

end

-- Create ESP for new players

game.Players.PlayerAdded:Connect(createPlayerESP)

-- Remove ESP for leaving players

game.Players.PlayerRemoving:Connect(removePlayerESP)

