{ ... }: 
let
  everlookPorts = [
    1119
    3724
    8081
    8084
    8086
    8090
  ];
in
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  networking.firewall = {
    allowedTCPPorts = everlookPorts;
    allowedUDPPorts = everlookPorts;
  };
}
