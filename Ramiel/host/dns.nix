{ ... }: {
  services.unbound = {
    enable = true;
    settings = {
      server = {
        interface = [
          "192.168.11.113" # Local Network
          "10.0.0.5" # VPN Network
        ];
        port = 53;

        access-control = [
          "192.168.11.0/24 allow" # Local Network
          "10.0.0.0/24 allow" # VPN Network
        ];

        # For security and privacy
        hide-identity = true;
        hide-version = true;
        harden-glue = true;
        harden-dnssec-stripped = true;


        local-zone = [
          "\"iruma.arc.\" static"
        ];
        local-data = [
          # Proxmox servers
          "\"gabriel.iruma.arc. IN A 192.168.11.80\""
          "\"lucifer.iruma.arc. IN A 192.168.11.84\""
          "\"metatron.iruma.arc. IN A 192.168.11.82\""
          "\"raphael.iruma.arc. IN A 192.168.11.81\""
          "\"zadkiel.iruma.arc. IN A 192.168.11.83\""

          # Gabriel VMs
          "\"azrael.iruma.arc. IN A 192.168.11.100\""
          # "\"haniel.iruma.arc. IN A 192.168.11.101\""
          "\"camael.iruma.arc. IN A 192.168.11.102\""
          # "\"ariel.iruma.arc. IN A 192.168.11.103\""

          # Metatron VMs
          "\"uriel.iruma.arc. IN A 192.168.11.112\""
          "\"ramiel.iruma.arc. IN A 192.168.11.113\""
          "\"sandalphon.iruma.arc. IN A 192.168.11.114\""
          "\"armaros.iruma.arc. IN A 192.168.11.115\""

          # Raphael VMs
          "\"esriel.iruma.arc. IN A 192.168.11.128\""
          "\"israfel.iruma.arc. IN A 192.168.11.129\""
          "\"haniel.iruma.arc. IN A 192.168.11.130\""
          "\"nathaniel.iruma.arc. IN A 192.168.11.131\""

          # Zadkiel VMs
          "\"sahaqiel.iruma.arc. IN A 192.168.11.145\""

          # Windows
          "\"baraqiel.iruma.arc. IN A 192.168.11.144\""

          # Services
          "\"proxmox.iruma.arc. IN A 192.168.11.114\""
          "\"ollama.iruma.arc. IN A 192.168.11.114\""
          "\"nas.iruma.arc. IN A 192.168.11.114\""

          # Aliases
          "\"desktop.iruma.arc. IN A 192.168.11.90\""
          "\"wireguard.iruma.arc. IN A 192.168.11.112\""
          "\"dns.iruma.arc. IN A 192.168.11.113\""
          "\"nginx.iruma.arc. IN A 192.168.11.113\""
          "\"vault.iruma.arc. IN A 192.168.11.128\""
        ];
      };

      forward-zone = {
        name = ".";
        forward-tls-upstream = true;
        forward-addr = [
          "1.1.1.1@853#cloudflare-dns.com"
          "1.0.0.1@853#cloudflare-dns.com"
        ];
      };
    };
  };
}
