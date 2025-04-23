{pkgs, config,lib, super, ...}:
{




	programs.dircolors.enable = true;
	programs.eza.enable = true;
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

		initExtra = ''
			autoload -U colors && colors # Load colors
			PS1="%B%{$fg[magenta]%}[%{$fg[cyan]%}%n%{$fg[blue]%} %~%{$fg[magenta]%}]%{$reset_color%}$%b "
			setopt correct
			setopt nobeep
			stty stop undef # Disable ctrl-s to freeze terminal.
			'';

	};

      programs.zsh.shellAliases	= {
		nixup = "pushd /etc/nixos; sudo nix flake update; popd";
		nixq = "nix-store -q --requisites /run/current-system/sw | wc -l";
		cleanup = "sudo nix-collect-garbage -d";
		bloat = "nix path-info -Sh /run/current-system";
		nixhost = "pushd /etc/nixos; sudo nixos-rebuild switch --flake .#nixos ";


# Custom packages script
		ncdu = "${pkgs.dua}/bin/dua interactive";


# confirm before overwriting something
		cp = "cp -riv";
		mv = "mv -iv";
		rm = "rm -rifv";
		mkdir = "mkdir -pv";

# colorize
		ls = "eza -hal --color=always --group-directories-first -s extension";
		cat = "${pkgs.bat}/bin/bat --paging=never --style=plain";
		tree = "${pkgs.eza}/bin/eza --tree --icons";
		diff = "diff --color=auto";
		ip = "ip --color=auto";

# Adding flags
		df = "df -h";
		free = "free -m";
		jctl = "journalctl -p 3 -xb";


		addup = "git add -u";
		addall = "git add .";
		branch = "git branch";
		checkout = "git checkout";
		clone = "git clone";
		commit = "git commit -m";
		fetch = "git fetch";
		pull = "git pull origin";
		push = "git push origin";
		status = "git status";
		tag = "git tag";
		newtag = "git tag -a";
		subadd = "git submodule add";
		subup = "git submodule update --remote --merge";

		pfetch = "curl -s https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch | sh";
	};


}
