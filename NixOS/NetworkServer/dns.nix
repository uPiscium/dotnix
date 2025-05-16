{ ... }: {
  # This is a DNS server configuration for NixOS.
  # It uses the dnsdist service to provide DNS resolution.
  # The configuration is set to listen on port 53 for both IPv4 and IPv6.

  services.dnsmasq.enable = true;
  services.dnsmasq.settings = {
    interface = "eno1";
    port = 53;
    listen-address = "192.168.11.100";
    no-dhcp-interface = "eno1";
    server = [
      "8.8.8.8"
      "8.8.4.4"
    ];
    domain = "iruma";
    address = [
      "/desktop.iruma/192.168.11.90"
      "/network.iruma/192.168.11.100"
      "/nas.iruma/192.168.11.120"
      "/nextcloud.iruma/192.168.11.120:40000"
      "/minecraft.iruma/192.168.11.130"
    ];
  };
}

