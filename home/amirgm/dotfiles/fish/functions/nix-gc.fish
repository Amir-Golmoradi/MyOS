function nix-gc
    sudo nix-store --gc
    or return $status

    sudo nix-store --optimise
end
