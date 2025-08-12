{config,  pkgs, lib, ...}:

{
    home.pointerCursor = {
      gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

programs.tofi = {
  enable = true;
  settings = { 

    background-color = "#000000";
    border-width = 0;
    font = "monospace";
    height = "100%";
    num-results = 5;
    outline-width = 0;
    padding-left = "35%";
    padding-top = "35%";
    result-spacing = 25;
    width = "100%";
  };

};


wayland.windowManager.hyprland = {
  enable = true;

  settings = {
    "$mod1" = "SUPER";
    "$mod2" = "SUPERSHIFT";
    "$terminal" = "foot";
    "$browser" = "librewolf";
    "$browser1" = "qutebrowser";
    "$editor" = "neovim";
    "$menu" = "tofi";

    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1,"

    ];
    env = [
      "QT_QPA_PLATFORM,wayland"
      "SDL_VIDEODRIVER,wayland"
      "CLUTTER_BACKEND,wayland"
      "GDK_BACKEND,wayland"
      "MOZ_ENABLE_WAYLAND,1"
      "MOZ_WEBRENDER,1"
      "OZONE_PLATFORM,wayland"
      "NIXOS_OZONE_WL,1"

    ];

    exec-once = [
      "foot &"
      "nm-applet &"
      "wbg /home/reda/pix/pix1.png &"
    ];

    misc = {
      force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. (
      };
      general = {
        allow_tearing = false;
        border_size = 2;
        gaps_in = 8;
        gaps_out = 8;
        layout = "dwindle";
      };

      animations = {
        enabled = true;
      };
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };


      input = {
        kb_layout = "fr";
        kb_options = "caps:swapescape";
        accel_profile = "flat";
        repeat_rate = 150;
        repeat_delay = 300;
        touchpad = {
          natural_scroll = true;
        };

      };

      bind = [
        "$mod1, Q, killactive"
        "$mod1, D, exec, tofi-drun | xargs hyprctl dispatch exec --"
        "$mod1, B, exec, $browser"
        "$mod1, A, exec,  onlyoffice-desktopeditors"
        "$mod1, C, exec, $browser1"

        "$mod1, &, workspace, 1"
        "$mod1, é, workspace, 2"
          # Move focus

          "$mod1, H, movefocus, l"
          "$mod1, L, movefocus, r"
          "$mod1, K, movefocus, u"
          "$mod1, J, movefocus, d"

          # Move active window
          "$mod2, H, movewindow, l"
          "$mod2, L, movewindow, r"
          "$mod2, K, movewindow, u"
          "$mod2, J, movewindow, d"


          "$mod2, Q, exec, wlogout"

          "$mod1, Return, exec, $terminal"

        ];

        bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];



    };
  };
}
