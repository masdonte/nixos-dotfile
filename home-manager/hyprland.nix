{config,  pkgs, lib, ...}:

{


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

          general = {
            allow_tearing = false;
          };

          animations = {
            enabled = true;

          };


          input = {
            kb_layout = "fr";
            kb_options = "caps:swapescape";
            accel_profile = "flat";
            touchpad = {
              natural_scroll = true;
            };

          };

          bind = [
            "$mod1, Q, killactive"
            "$mod1, D, exec, tofi-drun | xargs hyprctl dispatch exec --"
            "$mod1, B, exec, $browser"
            "$mod1, A, exec, libreoffice"
            "$mod1, C, exec, $browser1"
            "$mod1, H, movefocus, l"
            "$mod1, L, movefocus, r"
            "$mod1, K, movefocus, u"
            "$mod1, J, movefocus, d"
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
