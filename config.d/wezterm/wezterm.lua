-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night"
config.font_size = 10.0
config.warn_about_missing_glyphs = false
config.font = wezterm.font_with_fallback({
  "CaskaydiaCove Nerd Font",
  "JetBrains Mono",
  "Nerd Font Symbols",
  "HackGen Console NFJ",
  "Noto Color Emoji",
})
config.inactive_pane_hsb = {
  saturation = 0.8,
}
config.keys = {
  {
    key = "Escape",
    mods = "ALT",
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key = "y",
    mods = "ALT",
    action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
  },
  {
    key = "p",
    mods = "ALT",
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    key = "p",
    mods = "ALT",
    action = wezterm.action.PasteFrom 'PrimarySelection',
  },
  {
    key = "t",
    mods = "ALT",
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = "d",
    mods = "ALT",
    action = wezterm.action.SplitVertical {domain = 'CurrentPaneDomain'},
  },
}
return config
