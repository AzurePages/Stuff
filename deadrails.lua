-- SSCRIPT MADE BY AZURE PLEASE DONT SKID THIS ITS HORRIBLE
--[[ press "H" to teleport all items in the nearest generation chunk towards you press V to teleport 500 studs wherever you're lookin

i might edit it and make it auto teleport but i dont know how to sort the valuables from the junk

]]
local READTHECOMMENTS = true --hopefully


local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local teleporting = false
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

task.spawn(function()
    while true do
        task.wait(0.3)

        if UserInputService:IsKeyDown(Enum.KeyCode.H) then -- checks if its being pressed u can change idc also change H to any other keybind if u dont like H idc
            local Items = workspace.RuntimeItems:GetChildren()
            for _, item in ipairs(Items) do
                if item and item.Parent then
                    if item:IsA("Model") then
                        local PrimaryPart = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
                        if PrimaryPart then
                            item:SetPrimaryPartCFrame(HumanoidRootPart.CFrame + Vector3.new(0, 3, 0))
                        end
                    elseif item:IsA("BasePart") then
                        item.Position = HumanoidRootPart.Position + Vector3.new(0, 3, 0)
                    end
                end
            end
        end
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end

    if input.KeyCode == Enum.KeyCode.V and not teleporting then -- change the keyboard to teleport
        teleporting = true
        while UserInputService:IsKeyDown(Enum.KeyCode.V) do
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + HumanoidRootPart.CFrame.LookVector * 500 -- change the stud disstance (300 for 300 studs 1000 for 1000 studs)
            task.wait(1) -- cooldown
        end
        teleporting = false
    end
end)
