{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.displayManager.defaultSession = "none+i3";

  # i3lock authentication through PAM.
  security.pam.services.i3lock = { };

  environment.systemPackages = with pkgs; [
    dmenu polybar dunst picom feh i3lock xss-lock
    xbindkeys xcape xdotool maim wmctrl
    xorg.xrandr xorg.xinput xorg.xev xorg.xset xorg.xsetroot
    lxappearance xsettingsd brightnessctl
    playerctl pamixer pavucontrol
    xclip xdg-utils papirus-icon-theme
    # Required by the *uploaded* Arch i3 autostart and theme scripts.
    dex udiskie networkmanagerapplet libnotify
    xorg.xrdb pulseaudio psmisc
    # Runtime for uploaded Bash/GTK theme scripts, not Python dev tooling.
    bash python3
    adw-gtk3
  ];
  # Arch i3, Polybar, picom and theme scripts are imported under
  # home/amirgm/dotfiles. Dunst and original Kitty targets are still missing.
}
