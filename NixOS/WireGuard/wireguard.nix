{ ... }: {
  # enable NAT
  networking.nat.enable = true;
  networking.nat.externalInterface = "eth0";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = {
    allowedUDPPorts = [ 30000 ];
  };

  networking.wireguard.enable = true;
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.0.0.1/24" ];
      listenPort = 30000;

      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
      '';
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -o eth0 -j MASQUERADE
      '';

      privateKeyFile = "/home/upiscium/WireGuard/server.key";

      peers = [
        {
          # ROGSTRIX
          publicKey = "3HSsRWsAsRR568ZqxePeJ/jriPcudhRVdtAciWR6tkg=";
          allowedIPs = [ "10.0.0.2/32" ];
        }
        {
          # ROGPhone6
          publicKey = "RSd+ou+GdtSou2X5QrcfbfhKhalTIbDEM5zjH5zOb38=";
          allowedIPs = [ "10.0.0.3/32" ];
        }
      ];
    };
  };
  ...
  }

