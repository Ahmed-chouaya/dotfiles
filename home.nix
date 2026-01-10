{ pkgs, caelestia-shell, ... }:

{
  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";
  home.stateVersion = "25.11";


  # Packages installed for the user
  home.packages = with pkgs; [
    # Caelestia Shell
    caelestia-shell.packages.${pkgs.system}.default


    # Runtime deps Caelestia expects
    wl-clipboard
    playerctl
    brightnessctl
    networkmanager
    pipewire
    wireplumber

    # Personal Packages
    brave
    gh
    opencode
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
