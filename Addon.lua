
local Addon = LibStub('AceAddon-3.0'):NewAddon('tdActionButtonStyle', 'AceEvent-3.0', 'AceHook-3.0')

function Addon:OnInitialize()
    self.buttonNames = {}

    self:SecureHook('SetActionUIButton', 'InitButton')
    self:RegisterEvent('ACTIONBAR_SHOWGRID', 'ShowAllNames')
    self:RegisterEvent('ACTIONBAR_HIDEGRID', 'HideAllNames')

    for _, button in ipairs(ActionBarButtonEventsFrame.frames) do
        self:InitButton(button)
    end
end

function Addon:InitButton(button, withOutName)
    button.HotKey:SetFontObject('NumberFontNormal')

    if button:GetWidth() < 40 then
        button.icon:SetTexCoord(0.06, 0.94, 0.06, 0.94)
    end

    if not withOutName and button.Name then
        button.Name:Hide()
        self.buttonNames[button.Name] = true
    end
end

function Addon:HideAllNames()
    for name in pairs(self.buttonNames) do
        name:Hide()
    end
end

function Addon:ShowAllNames()
    for name in pairs(self.buttonNames) do
        name:Show()
    end
end
