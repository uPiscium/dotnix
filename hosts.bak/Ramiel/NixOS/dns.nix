{ ... }: {
  # This is a DNS server configuration for NixOS.
  # It uses the dnsdist service to provide DNS resolution.
  # The configuration is set to listen on port 53 for both IPv4 and IPv6.

  services.dnsmasq.enable = true;
  services.dnsmasq.settings = {
    interface = "ens18";
    port = 53;
    listen-address = [ "192.168.11.113" "10.0.0.5" ];
    no-dhcp-interface = "ens18";
    server = [
      "8.8.8.8"
      "8.8.4.4"
    ];
    domain = "iruma.arc";
    address = [
      # Proxmox webUI endpoint
      "/proxmox.iruma.arc/192.168.11.114"
      "/proxmox-main-node.iruma.arc/192.168.11.114"
      "/proxmox-gabriel.iruma.arc/192.168.11.114"
      "/proxmox-metatron.iruma.arc/192.168.11.114"
      "/proxmox-raphael.iruma.arc/192.168.11.114"
      "/proxmox-zadkiel.iruma.arc/192.168.11.114"

      # Proxmox servers
      "/gabriel.iruma.arc/192.168.11.80"
      "/metatron.iruma.arc/192.168.11.82"
      "/raphael.iruma.arc/192.168.11.81"
      "/zadkiel.iruma.arc/192.168.11.83"

      # Gabriel VMs
      "/azrael.iruma.arc/192.168.11.100"
      "/sahaquiel.iruma.arc/192.168.11.101"
      "/ariel.iruma.arc/192.168.11.102"

      # Metatron VMs
      "/uriel.iruma.arc/192.168.11.112"
      "/ramiel.iruma.arc/192.168.11.113"
      "/sandalphon.iruma.arc/192.168.11.114"

      # Raphael VMs
      "/israfel.iruma.arc/192.168.11.128"
      "/nathaniel.iruma.arc/192.168.11.129"
      "/haniel.iruma.arc/192.168.11.130"

      # Zadkiel VMs
      "/baraqiel.iruma.arc/192.168.11.144"

      # Services (Connect to Nginx in Sandalphon)
      "/ollama.iruma.arc/192.168.11.114"
      "/pdf-translator.iruma.arc/192.168.11.114"

      # Aliases
      "/desktop.iruma.arc/192.168.11.90" # Zadkiel
      "/gpu-1.iruma.arc/192.168.11.100" # Azrael
      "/gpu-2.iruma.arc/192.168.11.101" # Sahaquiel
      "/minecraft.iruma.arc/192.168.11.102" # Ariel
      "/wireguard.iruma.arc/192.168.11.112" # Uriel
      "/dns.iruma.arc/192.168.11.113" # Ramiel
      "/nginx.iruma.arc/192.168.11.114" # Sandalphon
      "/nextcloud.iruma.arc/192.168.11.128" # Israfel
      "/nas.iruma.arc/192.168.11.128" # Israfel
      "/apache.iruma.arc/192.168.11.129" # Nathaniel
      "/container-runnner.iruma.arc/192.168.11.130" # Haniel
    ];
  };
}
