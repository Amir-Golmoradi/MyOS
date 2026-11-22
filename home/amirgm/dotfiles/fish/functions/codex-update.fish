function codex-update --description "Update Codex CLI"
    echo "Updating Codex..."

    if not nix profile upgrade codex --refresh
        echo "Codex update failed."
        return 1
    end

    echo "Installed version:"
    ~/.nix-profile/bin/codex --version
end
