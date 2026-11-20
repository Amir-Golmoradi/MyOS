{ pkgs }:
pkgs.mkShell { packages = with pkgs; [ gcc clang lldb cmake gnumake pkg-config ]; }
