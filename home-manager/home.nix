{ config, pkgs, lib, ... }:{

  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./foot.nix
    ./neovim.nix
    ./firefox.nix
    ./zsh.nix
    ./mpv.nix
  ];




  home.username = "reda";
  home.homeDirectory = "/home/reda";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  services.udiskie = {
    enable = true;
    automount = true;
  };

  programs.git = {
    userName = "masdonte";
    userEmail = "poonic54@protonmail.com";
    enable = true;
    extraConfig.safe.directory = [
      "/etc/nixos"
      "/home/reda"
    ];

    delta = {
      enable = true;
    };
  };


  programs.onlyoffice = {
    enable = true;
  };

  home.packages = with pkgs; [

    yt-dlp
    pamixer
    croc
    bottom
    zellij
    zip
    doas
    wget
    networkmanagerapplet
    bat
    ncdu
    skim # rust alt for fzf


    wbg # wallpaper
    tealdeer
    ripgrep
    eza
    batmon
    brightnessctl
    bluetui
    playerctl


  ];



  home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
        };

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/reda/etc/profile.d/hm-session-vars.sh
#

# Let Home Manager install and manage itself.
programs = {
  home-manager.enable = true;
};

}
