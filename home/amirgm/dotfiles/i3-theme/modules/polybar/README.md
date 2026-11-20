# Polybar module

Polybar colors live in `~/.config/polybar/themes/mocha.ini`, `latte.ini` and `current.ini` (symlink). Theme definitions use `[i3theme]` rather than `[colors]` to avoid name clashes. The installer adapts common color values of **one** existing main Polybar config; it does **not** assume which bars or monitors you have or replace the launch script.

For custom modules, replace literal colors with `${i3theme.red}`, `${i3theme.mauve}`, `${i3theme.base}`, `${i3theme.text}`, etc. Add `include-file = themes/current.ini` within your Polybar file if your config was not auto-modified. Ensure `enable-ipc = true` for reliable `polybar-msg cmd restart`; fallback is your existing `launch_polybar.sh`.
