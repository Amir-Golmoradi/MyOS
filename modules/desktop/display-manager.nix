{ ... }:
{
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.gtk.enable = true;
  };
  # No GNOME desktop or GDM.
}
