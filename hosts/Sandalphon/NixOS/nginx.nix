{ ... }: {
  services.nginx = {
    enable = true;
    virtualHosts."qwen3.iruma.arc" = {
      # HTTP のみ（HTTPSが不要な場合）
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://192.168.11.90:3000";
        proxyWebsockets = true; # WebSocketも通す場合
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
