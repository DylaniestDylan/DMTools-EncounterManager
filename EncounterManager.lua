local ADDON_TITLE = "DM Tools - Encounter Manager"

local window = CreateFrame(
        "Frame",
        nil,
        UIParent,
        "BasicFrameTemplateWithInset"
)

window:SetSize(600, 400)
window:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
window:SetFrameStrata("DIALOG")
window:EnableMouse(true)
window.TitleText:SetText(ADDON_TITLE)
window:Hide()

window.CloseButton:SetScript("OnClick", function()
    window:Hide()
end)

local function ShowWindow()
    window:Show()
end

SLASH_ENCOUNTERMANAGER1 = "/dmtem"
SlashCmdList["ENCOUNTERMANAGER"] = ShowWindow

local minimapButton = CreateFrame("Button", nil, Minimap)
minimapButton:SetSize(32, 32)
minimapButton:SetPoint("CENTER", Minimap, "CENTER", -65, -40)
minimapButton:SetFrameLevel(Minimap:GetFrameLevel() + 5)
minimapButton:RegisterForClicks("LeftButtonUp")

local icon = minimapButton:CreateTexture(nil, "ARTWORK")
icon:SetSize(20, 20)
icon:SetPoint("CENTER", minimapButton, "CENTER", 0, 0)
icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")

local border = minimapButton:CreateTexture(nil, "OVERLAY")
border:SetSize(54, 54)
border:SetPoint("TOPLEFT", minimapButton, "TOPLEFT", 0, 0)
border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

minimapButton:SetHighlightTexture(
        "Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight"
)

minimapButton:SetScript("OnClick", ShowWindow)

minimapButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText(ADDON_TITLE)
    GameTooltip:AddLine("Left-click to open.", 1, 1, 1)
    GameTooltip:Show()
end)

minimapButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)