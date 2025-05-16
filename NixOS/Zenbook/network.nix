{ ... }: {
  networking.firewall = {
    allowedUDPPorts = [ 8000 ];
  };

  environment.etc = {
    "resolv.conf".text = ''
      nameserver 192.168.11.1
      nameserver 10.0.0.1
      nameserver 8.8.8.8
      nameserver 8.8.4.4
    '';
  };
}
