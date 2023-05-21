local partName = "Door" -- Replace with the name of the specific part you want to disable ESP for



local function disableESP(part)

    local esp = part:FindFirstChild("ESP")

    if esp then

        esp:Destroy()

    end

end

-- Function to handle part added event

local function onPartAdded(part)

    if part.Name == partName then

        disableESP(part)

    end

end

-- Function to handle part removed event

local function onPartRemoved(part)

    if part.Name == partName then

        disableESP(part)

    end

end

-- Disable ESP for existing parts

for _, part in ipairs(workspace:GetDescendants()) do

    if part.Name == partName then

        disableESP(part)

    end

end

-- Track parts added or removed from the workspace

workspace.ChildAdded:Connect(function(child)

    if child.Name == partName then

        disableESP(child)

    end

end)

workspace.ChildRemoved:Connect(function(child)

    if child.Name == partName then

        disableESP(child)

    end

end)

