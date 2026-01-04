{ pkgs, flake, ... }:

{
  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";
  home.stateVersion = "25.11";

  # -------------------------------
  # Packages
  # -------------------------------
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

  # -------------------------------
  # Caelestia
  # -------------------------------
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

  # -------------------------------
  # Session environment
  # -------------------------------
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
    SYSTEM_THEME = "dark";
  };

  # -------------------------------
  # Hyprland configuration
  # -------------------------------
  # Main Hyprland config file
  home.file.".config/hypr/hyprland.conf".source = "${flake}/hyprland/hyprland.conf";

  # Modular files folder (env.conf, general.conf, etc.)
  home.file.".config/hypr/hyprland/".source = "${flake}/hyprland";
}
