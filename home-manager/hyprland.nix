{config,  pkgs, lib, ...}:

{


	wayland.windowManager.hyprland = {
		enable = true;

		settings = {
			"$mod1" = "SUPER";
			"$terminal" = "foot";
			"$browser" = "firefox";
			"$editor" = "neovim";

			monitors = [

				"eDP-1,1920x1080@60,0x0, 1"

			];

			exec-once = [
				"foot"
			];

			general = {
				allow_tearing = false;
			};

			animations = {
				enabled = true;

			};


			input = {
				kb_layout = "fr";

			};

			bind = [
				"$mod1, Q, killactive"
					"$mod1, Return, exec, $terminal"
			];

		};
	};
}
