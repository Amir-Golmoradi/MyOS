# Preserved Arch inventory (not automatically installed)

The text files are the source inventory provided during the Arch-to-NixOS
migration. They include historical and explicitly excluded packages for audit.
Do not copy `pacman -Q` lists directly into environment.systemPackages.
NixOS manages many dependencies and drivers through modules.
