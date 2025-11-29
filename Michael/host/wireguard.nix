{ ... }: {
  networking.wireguard.enable = true;
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.1.0.3/32" ];
      dns = [ "192.168.11.92" ];
      mtu = 1420;
      privateKeyFile = "/home/upiscium/WireGuard/Michael.key";
      postUp = ''
        resolvectl dns wg0 192.168.11.92 && resolvectl domain wg0 '~.'
      '';
      postDown = ''
        resolvectl revert wg0
      '';
      peers = [
        {
          publicKey = "kuOclu/0Oig8B9HEpPfNPHG0Ycc8RnD7QW8rMQwRfyo=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "upiscium.f5.si:2000";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}

