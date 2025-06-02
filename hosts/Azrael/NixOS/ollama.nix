{ pkgs, ... }: {
  services.ollama = {
    enable = true; acceleration = "cuda"; package = pkgs.ollama.override { acceleration = "cuda"; }; };
}
