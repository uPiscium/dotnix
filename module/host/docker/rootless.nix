{ ... }: {
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      daemon = {
        settings = {
          dns = [ "8.8.8.8" "8.8.4.4" ];
        };
      };
      };
    };
  };
}

