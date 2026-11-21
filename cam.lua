local plr = game.Players.LocalPlayer
local UIS = game.UserInputService
local CAMERA_RANGE = 5
game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

game.RunService.RenderStepped:Connect(function()
	-- camera
	local mouse = plr:GetMouse()
	local screenGui = game.StarterGui.ScreenGui
	local mousePos = Vector2.new(mouse.X - screenGui.AbsoluteSize.X/2,mouse.Y - screenGui.AbsoluteSize.Y/2) / screenGui.AbsoluteSize
	local cam = game.Workspace.CurrentCamera
	local root = plr.Character:FindFirstChild("HumanoidRootPart")
	local rootPos = root.Position
	
	if (UIS:IsKeyDown(Enum.KeyCode.LeftShift)) then CAMERA_RANGE = math.lerp(CAMERA_RANGE,28,0.1) else CAMERA_RANGE = math.lerp(CAMERA_RANGE,7,0.1) end
	local targetCamPos = rootPos + Vector3.new(0, 30, 0) + Vector3.new(mousePos.X * CAMERA_RANGE,0,mousePos.Y * CAMERA_RANGE)

	cam.CFrame = cam.CFrame:Lerp(CFrame.new(targetCamPos) * CFrame.Angles(math.rad(-90), 0, 0),0.2)
	
	-- making the player face where the cursor is
	local rootFacePos = Vector3.new(mouse.Hit.Position.X, rootPos.Y, mouse.Hit.Position.Z)
	root.CFrame = CFrame.lookAt(rootPos, rootFacePos)
end)
