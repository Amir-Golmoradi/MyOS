# Firefox: system theme integration

Manually select `System theme — auto` from `about:addons` → Themes and `Automatic` from Settings → General → Language and Appearance → Website appearance. The GTK/gsettings module sets the system appearance preference. Firefox on Linux then uses its native/GTK theme where supported.

This module never edits `prefs.js`, `user.js`, extensions, browser tabs, or a running profile. Firefox may require reopening to update the browser UI; a forced Light/Dark theme or addon can override the system preference.
