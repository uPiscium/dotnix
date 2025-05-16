{ ... }: {
  networking.firewall.allowedTCPPorts = [ 53 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  services.unbound = {
    enable = true;
    settings = {
      server = {
        # When only using Unbound as DNS, make sure to replace 127.0.0.1 with your ip address
        # When using Unbound in combination with pi-hole or Adguard, leave 127.0.0.1, and point Adguard to 127.0.0.1:PORT
        interface = [ "192.168.11.100" ];
        port = 53;
        access-control = [
          "127.0.0.1/32 allow"
          "192.168.11.0/24 allow"
          "10.0.0.0/24 allow"
        ];

        # Based on recommended settings in https://docs.pi-hole.net/guides/dns/unbound/#configure-unbound
        # do-ip4 = true;
        # do-udp = true;
        # do-tcp = true;
        harden-glue = true;
        harden-dnssec-stripped = true;
        use-caps-for-id = false;
        prefetch = true;
        edns-buffer-size = 1232;

        hide-identity = true;
        hide-version = true;

        private-address = [
          "192.168.11.0/24"
          "10.0.0.0/24"
        ];
        local-data = [
          ''"iruma.local.desktop            3600 IN A 192.168.11.90"''
          ''"iruma.local.network            3600 IN A 192.168.11.100"''
          ''"iruma.local.nas                3600 IN A 192.168.11.120"''
          ''"iruma.local.minecraftserver.   3600 IN A 192.168.11.130"''
        ];
      };
      forward-zone = [
        {
          name = ".";
          forward-addr = [
            "8.8.8.8" # Google DNS
            "8.8.4.4" # Google DNS
          ];
          forward-tls-upstream = true; # Protected DNS
        }
      ];
    };
  };
}
