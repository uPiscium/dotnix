{ ... }: {
  services.pihole-ftl = {
    enable = true;
    lists = [
      {
        url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
      }
    ];
    useDnsmasqConfig = true;
  };
  services.pihole-web = {
    enable = true;
    ports = [
      "80r"
      "443s"
    ];
  };
}

