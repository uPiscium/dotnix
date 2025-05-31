{ ... }: {
  networking.wireguard.enable = true;
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.0.0.4/24" ];
      mtu = 1420;
      privateKeyFile = "/home/upiscium/WireGuard/Sariel.key";
      peers = [
        {
          publicKey = "rj2Fy53+fondOM1dZ9trbNaXAVEM438UAcC6ni6beQM=";
          allowedIPs = [ "10.0.0.0/24" "192.168.11.0/24" ];
          endpoint = "uPiscium.f5.si:30000";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
