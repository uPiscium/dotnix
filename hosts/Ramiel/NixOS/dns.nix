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
      # Main desktop
      "/zadkiel.iruma.arc/192.168.11.90"

      # Proxmox servers
      "/gabriel.iruma.arc/192.168.11.114"
      "/metatron.iruma.arc/192.168.11.114"
      "/raphael.iruma.arc/192.168.11.114"

      # Gabriel VMs
      "/azrael.iruma.arc/192.168.11.100"

      # Metatron VMs
      "/uriel.iruma.arc/192.168.11.112"
      "/ramiel.iruma.arc/192.168.11.113"
      "/sandalphon.iruma.arc/192.168.11.114"

      # Services
      "/ollama.iruma.arc/192.168.11.114"

      # Aliases
      "/desktop.iruma.arc/192.168.11.90" # Zadkiel
      "/wireguard.iruma.arc/192.168.11.128" # Uriel
      "/dns.iruma.arc/192.168.11.129" # Ramiel
      "/nginx.iruma.arc/192.168.11.129" # Sandalphon

    ];
  };
}
