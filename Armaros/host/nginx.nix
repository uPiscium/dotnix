{ ... }: {
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts."yummy-control-server.upiscium.f5.si" = {
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://192.168.11.129:8000";
      };
    };

    virtualHosts."modelgen.upiscium.f5.si" = {
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://192.168.11.145:8001";
      };
    };
  };
}
