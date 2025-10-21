{ ... }: {
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;

    virtualHosts."modelgen.upiscium.f5.si" = {
      forceSSL = false;
      locations."/" = {
        proxyPass = "http://192.168.11.145:8001";
      };
    };
  };
}
