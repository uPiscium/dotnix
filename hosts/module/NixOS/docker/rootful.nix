{...}: {
  virtualisation = {
    docker = {
      enable = true;
      rootless.enable = false;
    };
  };
}
