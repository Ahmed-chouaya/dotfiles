{ pkgs, ... }:

{
  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # Runtime deps Caelestia expects
    wl-clipboard
    playerctl
    brightnessctl
    networkmanager
    pipewire
    wireplumber

    # Apps used by Hyprland config
    foot
    brave
    vscode
    thunar

    # Utilities
    jq
    fish
    grim
    slurp
    swappy
    mako
    wlogout
    xdg-utils
    hyprpaper

    # Tools
    gh
  ];

  programs.git.enable = true;

  programs.caelestia = {
    enable = true;

    systemd = {
      enable = false;
      target = "graphical-session.target";
    };

    settings = {
      bar.status.showBattery = false;
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };

    cli.enable = true;
  };

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
    SYSTEM_THEME = "dark";
  };
}
