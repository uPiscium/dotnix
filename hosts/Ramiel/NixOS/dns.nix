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
      "/zadkiel.iruma.arc/192.168.11.90"
      "/gabriel.iruma.arc/192.168.11.80"
      "/metatron.iruma.arc/192.168.11.81"
      "/raphael.iruma.arc/192.168.11.82"

      "/uriel.iruma.arc/192.168.11.112"
      "/ramiel.iruma.arc/192.168.11.113"
      "/sandalphon.iruma.arc/192.168.11.114"

      "/desktop.iruma.arc/192.168.11.90" # Zadkiel
      "/wireguard.iruma.arc/192.168.11.128" # Uriel
      "/dns.iruma.arc/192.168.11.129" # Ramiel
      "/nginx.iruma.arc/192.168.11.129" # Sandalphon

      # Services
      "/ollama.iruma.arc/192.168.11.114"
    ];
  };
}
