{ pkgs, ... }:
{
  programs.java = {
    enable = true;
    package = pkgs.jdk21;  # System default; JDK25 is also installed.
  };
  environment.systemPackages = with pkgs; [
    jdk25 kotlin gradle maven
    httpie shfmt
    rustup clang lldb cmake gnumake pkg-config
    nodejs
    # This is fwcd's Kotlin server, NOT JetBrains' kotlin-lsp-bin.
    kotlin-language-server
  ];
  # Kotlin/Native and JetBrains Kotlin LSP require separate verified packaging.
  # See migration/UNRESOLVED.md; no JDK17, .NET SDK, or Python dev tools.
}
