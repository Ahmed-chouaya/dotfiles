{ pkgs, caelestia-shell, ... }:

{
  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";
  home.stateVersion = "25.11";

  # Packages installed for the user
  home.packages = with pkgs; [
    # --------------------------
    # Caelestia Shell
    # --------------------------
    caelestia-shell.packages.${pkgs.system}.default

    # --------------------------
    # Runtime deps Caelestia expects
    # --------------------------
    wl-clipboard
    playerctl
    brightnessctl
    networkmanager
    pipewire
    wireplumber

    # --------------------------
    # Personal Packages
    # --------------------------
    brave
    gh

    # --------------------------
    # Hyprland / Wayland dependencies
    # --------------------------
    hyprland
    foot
    vscode
    thunar
    wayland-protocols
    polkit-gnome
    libinput
    xrandr       # optional for monitor config

    # --------------------------
    # Audio / Multimedia
    # --------------------------
    pamixer      # for volume keybinds
    swaylock     # screen lock (or hyprland-lock if available)

    # --------------------------
    # Cursor / Theme / GTK+ Qt
    # --------------------------
    sweet-cursors
    lxappearance
    qt5ct
    qt6ct

    # --------------------------
    # Optional extras
    # --------------------------
    # hyprpaper   # wallpaper manager if you want dynamic wallpapers
  ];

  programs.git.enable = true;

  # Optional: environment sanity
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";

    # System theme variable
    SYSTEM_THEME = "dark";
  };
}
