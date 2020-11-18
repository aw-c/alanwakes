local helixesp = {}
helixesp.infocol3		=	Color(218, 218, 218, 255)	-- set default color of info (info)
helixesp.infocol2		=	Color(0, 0, 0, 255)
-------------------------
local AESP = {}
hook.Add('HUDPaint', 'awHookSomething', function()
		if LocalPlayer():KeyDown(IN_ATTACK) then
			for k,v in pairs(player.GetAll()) do
					local position = (v:GetPos() + Vector(0, 0, 100)):ToScreen()
					local color = team.GetColor(v:Team())
          draw.SimpleTextOutlined ( v:SteamName().." [ "..v:GetUserGroup().." ] ", 'Default', position.x - 5, position.y - 12, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )	
					draw.SimpleTextOutlined ( v:GetName(), 'Default', position.x - 5, position.y - 2, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )	
						draw.SimpleTextOutlined ( 'D: ' .. math.Round(v:GetPos():Distance(LocalPlayer():GetPos())), 'Default', position.x - 5, position.y + 8, helixesp.infocol3, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )	
			end
			for k,v in pairs(ents.FindByClass("ix_item"))do
				local position = (v:GetPos() + Vector(0, 0, 5)):ToScreen()
				local color = Color(120,123,150,255)
				draw.SimpleTextOutlined ( v:GetItemTable().name, 'Default', position.x - 5, position.y - 2, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )	
				draw.SimpleTextOutlined ( 'D: ' .. math.Round(v:GetPos():Distance(LocalPlayer():GetPos())), 'Default', position.x - 5, position.y + 8, helixesp.infocol3, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )		
			end
			for k,v in pairs(ents.GetAll())do
				if v:IsNPC() then
					local position = (v:GetPos() + Vector(0, 0, 55)):ToScreen()
					local color = Color(255,93,0,255)
					draw.SimpleTextOutlined ( v:GetClass(), 'Default', position.x - 5, position.y - 2, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )	
					draw.SimpleTextOutlined ( 'D: ' .. math.Round(v:GetPos():Distance(LocalPlayer():GetPos())), 'Default', position.x - 5, position.y + 8, helixesp.infocol3, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )
				end
				if v:GetClass() == "ix_vendor" then
					local position = (v:GetPos() + Vector(0, 0, 55)):ToScreen()
					local color = Color(255,93,0,255)
					draw.SimpleTextOutlined ( v:GetClass(), 'Default', position.x - 5, position.y - 2, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )	
					draw.SimpleTextOutlined ( 'D: ' .. math.Round(v:GetPos():Distance(LocalPlayer():GetPos())), 'Default', position.x - 5, position.y + 8, helixesp.infocol3, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, helixesp.infocol2 )
				end
			end
			draw.DrawText("D:"..LocalPlayer():GetEyeTraceNoCursor().HitPos:Distance(LocalPlayer():GetPos()), "Default", ScrW() * 0.526, ScrH() * 0.5, Color(255,255,255,255), TEXT_ALIGN_CENTER)
		end
end)
hook.Remove("HUDPaint", "awDistance")
