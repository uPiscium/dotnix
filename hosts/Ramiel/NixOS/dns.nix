{ ... }: {
  # This is a DNS server configuration for NixOS.
  # It uses the dnsdist service to provide DNS resolution.
  # The configuration is set to listen on port 53 for both IPv4 and IPv6.

  services.dnsmasq.enable = true;
  services.dnsmasq.settings = {
    interface = "ens18";
    port = 53;
    listen-address = "192.168.11.113";
    no-dhcp-interface = "ens18";
    server = [
      "8.8.8.8"
      "8.8.4.4"
    ];
    domain = "iruma.arc";
    address = [
      "/gabriel.iruma.arc/192.168.11.80"
      "/metatron.iruma.arc/192.168.11.81"
      "/raphael.iruma.arc/192.168.11.82"
      "/desktop.iruma.arc/192.168.11.90"
      "/wireguard.iruma.arc/192.168.11.128"
      "/dns.iruma.arc/192.168.11.129"
      "/nas.iruma.arc/192.168.11.192"
    ];
  };
}
