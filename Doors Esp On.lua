-- Credit me when you are using this for your gui

local partName = "Door" -- Replace with the name of the specific part you want to create ESP for

local espText = "Door" -- Text to display in the ESP



local function createESP(part)

    

    local esp = Instance.new("BillboardGui")

    esp.Name = "ESP"

    esp.Adornee = part

    esp.Parent = part

    local textLabel = Instance.new("TextLabel")

    textLabel.BackgroundTransparency = 1

    textLabel.Size = UDim2.new(1, 0, 1, 0)

    textLabel.Text = espText

    textLabel.TextColor3 = Color3.new(1, 1, 1)

    textLabel.TextScaled = true

    textLabel.Parent = esp

end



local function onPartAdded(part)

    if part.Name == partName and part:IsA("BasePart") then

        createESP(part)

    end

end



local function onPartRemoved(part)

    if part.Name == partName then

        local esp = part:FindFirstChild("ESP")

        if esp then

            esp:Destroy()

        end

    end

end



for _, part in ipairs(workspace:GetDescendants()) do

    if part.Name == partName and part:IsA("BasePart") then

        createESP(part)

    end

end



workspace.ChildAdded:Connect(function(child)

    if child:IsA("BasePart") and child.Name == partName then

        createESP(child)

    end

end)

workspace.ChildRemoved:Connect(function(child)

    if child:IsA("BasePart") and child.Name == partName then

        local esp = child:FindFirstChild("ESP")

        if esp then

            esp:Destroy()

        end

    end

end)

