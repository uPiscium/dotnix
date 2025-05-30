{ ... }: {
  networking.useDHCP = false;
  networking.interfaces.vmbr0 = {
    useDHCP = false;
    ipv4.addresses = [
      {
        address = "192.168.11.128";
        prefixLength = 24;
      }
    ];
  };
  networking.defaultGateway = "192.168.11.1";
  networking.nameservers = [ "127.0.0.1" ];
}
