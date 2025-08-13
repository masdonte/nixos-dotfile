{config,  pkgs, lib, catppuccin, ...}:

{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 16;
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    firefox.enable = true;
    firefox.force = true;
    firefox.flavor = "mocha";

  };

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      size = 24;
    };

  };
  services.cliphist = {
    enable = true;
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
      "$browser" = "firefox";
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
        "wl-paste --type text --watch cliphist store &"
        "wbg /home/reda/pix/pix1.png &"
      ];

      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. 
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
"$mod1, ampersand, workspace,  1"
"$mod1, eacute, workspace, 2"
"$mod1, quotedbl, workspace, 3"
"$mod1, apostrophe, workspace, 4"
"$mod1, parenleft, workspace, 5"
"$mod1, egrave, workspace, 6"

"$mod2, ampersand, movetoworkspace, 1"
"$mod2, eacute, movetoworkspace, 2"
"$mod2, quotedbl, movetoworkspace, 3"
"$mod2, apostrophe, movetoworkspace, 4"
"$mod2, parenleft, movetoworkspace, 5"
"$mod2, egrave, movetoworkspace, 6"

          # Move focus

          "$mod1, Space, togglefloating"
          "$mod1, H, movefocus, l"
          "$mod1, L, movefocus, r"
          "$mod1, K, movefocus, u"
          "$mod1, J, movefocus, d"

          # clipboard
          "$mod1, V, exec, cliphist list | tofi | cliphist decode | wl-copy"

          # Move active window
          "$mod2, H, movewindow, l"
          "$mod2, L, movewindow, r"
          "$mod2, K, movewindow, u"
          "$mod2, J, movewindow, d"

          "$mod1, F, fullscreenstate, 1 0 " # Make client maximize"
          "$mod2, F, fullscreenstate, 0 2" # Make app-only fullscreen (fakefullscreen)

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
