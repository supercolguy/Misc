-- Find and disable player ESP

local function disablePlayerESP()

    for _, player in ipairs(game.Players:GetPlayers()) do

        local espGui = player.Character:FindFirstChild("PlayerESP")

        if espGui then

            espGui.Enabled = false

        end

    end

end

-- Call the function to disable player ESP

disablePlayerESP()

