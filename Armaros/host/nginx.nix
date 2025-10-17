{ ... }: {
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts."model-gen.upiscium.f5.si" = {
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://azrael.iruma.arc:8002";
        proxyWebsockets = true; # allow WebSocket
      };
    };
  };
}
