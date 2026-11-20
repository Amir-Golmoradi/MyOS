# Items that cannot safely be represented as equivalent Nixpkgs packages yet

1. **JetBrains Kotlin LSP** from Arch `kotlin-lsp-bin`: the provided module
   installs `kotlin-language-server` (fwcd project) as a **different** LSP.
   For the precise JetBrains binary and Neovim integration, verify a supported
   Nix package or add a pinned upstream build separately.
2. **Kotlin/Native** from `kotlin-native-bin`: Kotlin/JVM is configured; the
   Kotlin/Native compiler and platform toolchains are normally downloaded by
   the Kotlin Multiplatform Gradle plugin on the first native build. `pkgs.kotlin`
   is not a guaranteed standalone `konanc` package. The configuration enables
   `nix-ld` for downstream binary compatibility, but actual Gradle native
   builds still need to be tested on the installed laptop.
3. **SDKMAN** from Arch `sdkman-bin`: deliberately not installed by default.
   JDK 21/25 are declarative; installing SDKMAN by mutable scripts can conflict
   with Nix-managed toolchains. Add explicitly if you decide you still need it.
4. **ASUS GPU switching:** enabled asusd, but did not enable supergfxd or NVIDIA
   PRIME without the real GPU IDs. Run `lspci -nn | grep -Ei 'vga|3d|display'`.
5. **Arch desktop dotfiles:** actual i3, Polybar, picom, fish prompt and
   Catppuccin theme scripts ARE included. Uploaded Kitty files were external
   symlinks with missing targets. Actual Dunst, keyd and ~/.Xresources missing.
   See migration/DESKTOP-INTEGRATION.md.
6. **Full font inventory:** Nix-managed user fonts cover core requested fonts;
   your Adobe/SF Pro/other proprietary fonts are NOT redistributed here.
7. **Container images:** not embedded. `docker compose up` downloads them.

Known exclusions: Brave, Fresh Editor, Windscribe, Bruno, Claude Code, Helix,
LazyDocker, tmux, unzip as a user app, JDK 17, .NET SDK, Python dev tooling,
sqlc, actionlint, Tesseract, Exercism, kubectl, ShellCheck, zsh, Zulip,
GNOME desktop, and a native PostgreSQL/Redis/Vault installation.

Dependencies may still contain Bash/Python/unzip as transitive build/runtime
components. These aren't explicitly installed as user-facing development tools.

Official Kotlin/Native Gradle process: https://kotlinlang.org/docs/native-get-started.html
Official JetBrains Kotlin LSP: https://github.com/Kotlin/kotlin-lsp
