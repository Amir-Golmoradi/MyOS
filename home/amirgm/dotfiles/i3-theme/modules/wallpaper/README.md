# Wallpaper module

`feh` switches wallpaper with each theme transition. Included `mocha.png` and `latte.png` are offline fallback images. On the user's machine, dark mode **prefers the original** `~/wallpapers/WLX.jpg`; light mode prefers `~/wallpapers/WLX-light.jpg` if provided.

`session.sh` restores the saved wallpaper on every new i3 session without calling `i3-msg reload`, so it does not create a startup loop.
