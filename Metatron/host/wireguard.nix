{ ... }: {
  networking.wireguard.enable = true;
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.0.0.4/32" ];
      dns = [ "10.0.0.5/32" ];
      mtu = 1420;
      privateKeyFile = "/home/upiscium/WireGuard/Sariel.key";
      postUp = ''
        resolvectl dns wg0 10.0.0.5 && resolvectl domain wg0 '~.'
      '';
      postDown = ''
        resolvectl revert wg0
      '';
      peers = [
        {
          publicKey = "rj2Fy53+fondOM1dZ9trbNaXAVEM438UAcC6ni6beQM=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "upiscium.f5.si:30000";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}

