{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ollama
  ];

  services.ollama = {
    enable = true;
    port = 11434;
    host = "0.0.0.0";
    openFirewall = true;
  };
}
