{ pkgs, ... }: {
  networking.nat = {
    enable = true;
    externalInterface = "ens18";
    internalInterfaces = [ "wg0" ];
  };

  networking.wireguard.enable = true;
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.0.0.1/24" ];
      listenPort = 30000;
      mtu = 1420;

      postUp = ''
        ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT;
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -o ens18 -j MASQUERADE
      '';
      postDown = ''
        ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT;
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -o ens18 -j MASQUERADE
      '';

      privateKeyFile = "/home/upiscium/WireGuard/Uriel.key";

      peers = [
        {
          # Michael
          publicKey = "3DsO9S1f6ubU/b2WGWZMPlL4ApzGKwGPFeFod3r73m4=";
          allowedIPs = [ "10.0.0.2/32" ];
        }
        {
          # ROGphone6
          publicKey = "RSd+ou+GdtSou2X5QrcfbfhKhalTIbDEM5zjH5zOb38=";
          allowedIPs = [ "10.0.0.3/32" ];
        }
        {
          # Sariel
          publicKey = "Dyt4tHHZyhaNXUxSgMUq9JDeTey9OaRoLqFJXBlysiU=";
          allowedIPs = [ "10.0.0.4/32" ];
        }
        {
          # Ramiel
          publicKey = "lq7idsKzezSFbSXPGgJCJM13E483yQjjHMvsTIr5bUs=";
          allowedIPs = [ "10.0.0.5/32" ];
        }
      ];
    };
  };
}
