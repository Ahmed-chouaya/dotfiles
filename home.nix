{ pkgs, ... }:

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

    # Hyprland
    hyprland
  ];

  programs.git.enable = true;

  # -------------------------------
  # Wayland & Hyprland
  # -------------------------------
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Suppress warning - actual config is in copied files
      "$terminal" = "foot";
      "$browser" = "brave";
    };
  };

  # Copy hyprland configuration files
  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
    force = true;
    onChange = "chmod +x $HOME/.config/hypr/scripts/*.fish";
  };

  # Create hyprland desktop entry for proper session launching
  xdg.desktopEntries."Hyprland" = {
    name = "Hyprland";
    comment = "Hyprland Tiling Window Manager";
    exec = "Hyprland";
    type = "Application";
  };

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
  };
}
