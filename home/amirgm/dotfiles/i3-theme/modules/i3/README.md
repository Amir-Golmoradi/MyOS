# i3 module

`apply.sh` swaps `~/.config/i3/themes/current.conf` between Catppuccin Mocha/Latte themes then validates and reloads i3.

Both **`set $...` variables AND `client.*` directives are in the same include**: i3 does not permit relying on variables defined in an included file in the parent config. The installer removes only the original Catppuccin colors block and replaces it with:

```i3
include ~/.config/i3/themes/current.conf
```

Shortcut: `bindsym $mod+Shift+t exec --no-startup-id ~/.local/bin/i3-theme toggle`. Existing Super+L lock and Super+Space keyboard-language behavior remain untouched.
