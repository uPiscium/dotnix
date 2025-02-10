{pkgs, ...}: {
  networking.useDHCP = false;
  networking.interfaces.enp5s0 = {
    useDHCP = false;
    ipv4.addresses = [
      {
        address = "192.168.11.130";
        prefixLength = 24;
      }
    ];
  };
  networking.defaultGateway = "192.168.11.1";
  networking.nameservers = ["8.8.8.8"];
}
