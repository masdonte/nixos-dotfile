{pkgs, config, ...}:

{
	programs.dircolors.enable = true;
	programs.zsh = {
		enable = true;
		dotDir = ".config/zsh";
		enableCompletion = true;
		autosuggestion.enable = true;
		autocd = true;
		history = {
			save = 1000;
			size = 1000;
			path = "/home/reda/.cache/zsh/history";
			expireDuplicatesFirst = true;
		};
	};
}
