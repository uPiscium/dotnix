{ pkgs, ... }: {
  networking.firewall = {
    allowedUDPPorts = [ 30000 ];
  };

  networking.nat = {
    enable = true;
    externalInterface = "eth0";
    internalInterfaces = [ "wg0" ];
  };

  networking.wireguard.enable = true;
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.0.0.1/24" ];
      listenPort = 30000;
      mtu = 1420;

      postUp = ''
        ${pkgs.iptables}/bin/iptables -A FORWARD -i %i -j ACCEPT;
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE;
      '';
      postDown = ''
        ${pkgs.iptables}/bin/iptables -D FORWARD -i %i -j ACCEPT;
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE;
      '';

      privateKeyFile = "/home/upiscium/WireGuard/Server.key";

      peers = [
        {
          # ROGSTRIX
          publicKey = "3HSsRWsAsRR568ZqxePeJ/jriPcudhRVdtAciWR6tkg=";
          allowedIPs = [ "10.0.0.2/32" ];
        }
        {
          publicKey = "RSd+ou+GdtSou2X5QrcfbfhKhalTIbDEM5zjH5zOb38=";
          allowedIPs = [ "10.0.0.3/32" ];
        }
      ];
    };
  };
}
