{ pkgs, ... }:

{
  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";
  home.stateVersion = "25.11";

  # --------------------------
  # Packages installed for the user
  # --------------------------
  home.packages = with pkgs; [
    # Hyprland / Wayland dependencies
    hyprland
    foot
    vscode
    thunar
    wayland-protocols
    polkit-gnome
    libinput
    xrandr

    # Audio / Multimedia
    pipewire
    wireplumber
    playerctl
    pamixer
    brightnessctl
    swaylock

    # Cursor / Theme / GTK+ Qt
    sweet-cursors
    lxappearance
    qt5ct
    qt6ct

    # Shell
    fish

    # Personal Packages
    brave
    gh
  ];

  # Git
  programs.git.enable = true;

  # --------------------------
  # Environment variables
  # --------------------------
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
    SYSTEM_THEME = "dark";
  };

  # --------------------------
  # Caelestia Shell - Official Home-Manager module
  # --------------------------
  programs.caelestia-shell = {
    enable = true;
    systemd = {
      enable = false;  # start manually from compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status.showBattery = false;
      paths.wallpaperDir = "/home/ahmed/Images";
    };
    cli = {
      enable = true;  # adds caelestia-cli to PATH
      settings = {
        theme.enableGtk = false;
      };
    };
  };

  # --------------------------
  # Hyprland config (main file only)
  # --------------------------
  home.file.".config/hypr/hyprland.conf".source = ./hyprland/hyprland.conf;

  # Ensure config directories exist
  home.file.".config/hypr/".directory = true;
  home.file.".config/hypr/assets/".directory = true;

  # --------------------------
  # Workspace helper script
  # --------------------------
  home.file.".local/bin/wsaction.fish".source = ./scripts/wsaction.fish;
  home.file.".local/bin/wsaction.fish".executable = true;

  # --------------------------
  # Fish shell
  # --------------------------
  programs.fish.enable = true;
  programs.fish.defaultShell = true;
}
