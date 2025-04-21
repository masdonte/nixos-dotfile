{config,  pkgs, lib, ...}:

{


	services.hyprpaper = {
		enable = true;
	};
	wayland.windowManager.hyprland = {
		enable = true;

		settings = {
			"$mod1" = "SUPER";
			"$mod2" = "SUPERSHIFT";
			"$terminal" = "foot";
			"$browser" = "firefox";
			"$editor" = "neovim";

			monitor = [
				"eDP-1, 1920x1080@60, 0x0, 1"

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
					"SDL_VIDEODRIVER,wayland"

];

			exec-once = [
				"foot &"
				"nm-applet &"
				"firefox &"
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

			};

			bind = [
				"$mod1, Q, killactive"
					"$mod1, Return, exec, $terminal"
					"$mod2, Q, exec, uwsm stop"

			];

		};
	};
}
