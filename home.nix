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

    # Additional packages referenced in configs
    cliphist
    gnome-keyring
    polkit_gnome
    trash-cli
    geoclue2
    gammastep
    github-desktop
    nemo
    lxqt.qps
    pavucontrol
    hyprpicker
    ydotool
    kdePackages.qt6ct

    # Caelestia dots additional dependencies
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    inotify-tools
    app2unit
    eza
    adwaita-icon-theme
    papirus-icon-theme
    kdePackages.qt5ct
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    starship
    btop
    fastfetch
    micro
    spicetify-cli
  ];

  programs.git.enable = true;
  programs.starship.enable = true;

  # Configure fish shell
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -la";
      la = "eza -a";
    };
  };

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

  # Copy other Caelestia configuration files
  home.file.".config/fish" = {
    source = ./fish;
    recursive = true;
    force = true;
  };

  home.file.".config/foot" = {
    source = ./foot;
    recursive = true;
    force = true;
  };

  home.file.".config/btop" = {
    source = ./btop;
    recursive = true;
    force = true;
  };

  home.file.".config/fastfetch" = {
    source = ./fastfetch;
    recursive = true;
    force = true;
  };

  home.file.".config/micro" = {
    source = ./micro;
    recursive = true;
    force = true;
  };

  home.file.".config/spicetify" = {
    source = ./spicetify;
    recursive = true;
    force = true;
  };

  home.file.".config/thunar" = {
    source = ./thunar;
    recursive = true;
    force = true;
  };

  home.file.".config/uwsm" = {
    source = ./uwsm;
    recursive = true;
    force = true;
  };

  home.file.".config/zed" = {
    source = ./zed;
    recursive = true;
    force = true;
  };

  home.file.".config/Code/User/settings.json" = {
    source = ./vscode/settings.json;
    force = true;
  };

  home.file.".config/Code/User/keybindings.json" = {
    source = ./vscode/keybindings.json;
    force = true;
  };

  home.file.".config/code-flags.conf" = {
    source = ./vscode/flags.conf;
    force = true;
  };

  # Copy starship configuration
  home.file.".config/starship.toml" = {
    source = ./starship.toml;
    force = true;
  };

  # Firefox userChrome.css (requires manual profile setup)
  home.file.".mozilla/firefox/userChrome.css" = {
    source = ./firefox/userChrome.css;
    force = true;
  };

  # Zen browser configuration (requires manual profile setup)
  home.file.".zen/caelestiafox" = {
    source = ./zen;
    recursive = true;
    force = true;
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
