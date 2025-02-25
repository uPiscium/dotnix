{ pkgs, ... }: {
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    skktools
    mozcdic-ut-skk-jisyo
  ];

  environment.variables = {
    # GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    GLFW_IM_MODULE = "ibus";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-skk
    ];
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.caskaydia-cove
      source-sans
      source-serif
      source-han-sans
      source-han-serif
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "Source Han Serif" "Noto Color Emoji" ];
        sansSerif = [ "Source Han Sans" "Noto Color Emoji" ];
        monospace = [ "Caskaydia Cove Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
