{ pkgs, ... }:
{
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [ docker-compose docker-buildx ];
  # PostgreSQL / Redis / Vault are Docker Compose workloads, never host services.
  # Membership of the docker group gives root-equivalent access.
}
