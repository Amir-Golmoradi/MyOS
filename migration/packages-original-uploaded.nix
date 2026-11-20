
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal and shell utilities
    kitty
    tmux
    fzf
    fd
    ripgrep
    eza
    btop
    fastfetch
    jq
    tree
    wget
    rsync
    unzip
    zip

    # Editors and Git
    neovim
    helix
    git
    gh
    lazygit
    lazydocker

    # i3 desktop applications
    dmenu
    polybar
    dunst
    picom
    feh
    i3lock
    brightnessctl
    xclip
    xdotool
    lxappearance
    papirus-icon-theme

    # Desktop applications
    firefox
    mpv
    pavucontrol
    blueman

    # Development and infrastructure
    docker-compose
    maven
    httpie
    shfmt

    # Diagnostics
    bind
    dmidecode
    smartmontools
    wireshark

    # Backup tools
    borgbackup
    vorta
  ];
}

