{ pkgs, ... }: {
  home.packages = with pkgs; [
    docker-compose
    jdk17
    clang-tools
    clangStdenv
    gcc
    htop
  ];
}
