{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ollama-cuda
  ];

  services.ollama = {
    enable = true;
    acceleration = "cuda";
    package = pkgs.ollama.override { acceleration = "cuda"; };
    environmentVariables = {
      OLLAMA_FLASH_ATTANTION = "1";
      OLLAMA_KV_CACHE_TYPE = "q8_0";
    };
    port = 11434;
    host = "0.0.0.0";
    openFirewall = true;
  };
}

