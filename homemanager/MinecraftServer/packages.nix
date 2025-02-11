{ pkgs, ... }: {
  home.packages = with pkgs; [
    docker-compose
    jdk17
  ];
}
