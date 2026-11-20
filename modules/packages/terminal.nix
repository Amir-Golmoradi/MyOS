{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kitty fzf fd ripgrep eza btop fastfetch jq tree wget rsync
    git gh neovim gum stow
  ];
}
