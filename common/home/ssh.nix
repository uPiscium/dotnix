{ pkgs, ... }: {
  home.file.".ssh/config" = {
    source = ../../config.d/.ssh/config;
    recursive = false;
  };
}
