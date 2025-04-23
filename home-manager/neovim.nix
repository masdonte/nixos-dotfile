{config, pkgs, ...}:{

	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;

		plugins = with pkgs.vimPlugins; [
# Language servers
			vim-nix];
	};
		    }
