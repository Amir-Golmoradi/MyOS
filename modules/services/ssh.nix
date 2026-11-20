{ ... }:

{
  # SSH Server
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  # SSH Agent
  programs.ssh.startAgent = true;
}
