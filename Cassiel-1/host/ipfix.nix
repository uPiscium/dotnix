{ ... }: {
  networking.useDHCP = false;
  networking.interfaces.ens18 = {
    useDHCP = false;
    ipv4.addresses = [
      {
        address = "10.0.1.11";
        prefixLength = 24;
      }
    ];
  };
  networking.defaultGateway = "10.0.1.1";
  networking.nameservers = [ "192.168.11.92" ];
}
