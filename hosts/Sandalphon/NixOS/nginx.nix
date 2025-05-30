{ ... }: {
  services.nginx = {
    enable = true;
    virtualHosts."qwen3.iruma.arc" = {
      forceSSL = false; # allow HTTP access
      locations."/" = {
        proxyPass = "http://192.168.11.90:3000";
        proxyWebsockets = true; # allow WebSocket
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
