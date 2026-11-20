{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings."github.com" = {
      HostName = "ssh.github.com";
      Port = 443;
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519";
      IdentitiesOnly = true;
      AddKeysToAgent = "yes";
    };
  };
}
