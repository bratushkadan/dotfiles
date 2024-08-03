{
    description = "my system flake";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

        # home-manager is the way of managing configs for software via nix
        # (configs are linked to home directory)
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        # controls system level software and settings including fonts 
        darwin.url = "github:lnl7/nix-darwin";
        darwin.inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs = inputs: {
        darwinConfigurations.bratushkadan = inputs.darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            pkgs = import inputs.nixpkgs {
                system = "aarch64-darwin";
            };
            modules = [
                ({ pkgs, ...}: {
                    programs.zsh.enable = true;
                    environment.shells = [ pkgs.bash pkgs.zsh ];
                    environment.loginShell = pkgs.zsh;
                    nix.extraOptions = ''
                        experimental-features = nix-command flakes
                    '';
                    systemPackages = [ 
                        # pkgs.bat
                        pkgs.coreutils 
                        # pkgs.fzf
                        # pkgs.neovim
                        # pkgs.ripgrep
                    ];
                    system.keyboard.enableKeyMapping = true;
                    fonts.fontDir.enable = false; # DANGER: true -> uninstall system fonts not controlled by nix
                    fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; }) ];
                    services.nix-daemon.enable = true;
                    system.defaults.finder.AppleShowAllExtensions = true;
                    system.defaults.dock.autohide = true;
                    # system.defaults.NSGlobalDomain.InitialKeyRepeat = 14;
                    # system.defaults.NSGlobalDomain.KeyRepeat = 1;
                })
                inputs.home-manager.darwinModules.home-manager
                {
                    useGlobalPkgs = true;
                    useUserPkgs = true;
                    users.bratushkadan.imports = [
                        ({pkgs, ...}: {
                            home.packages = [ pkgs.ripgrep pkgs.fd ];
                            home.sessionVariables = {
                                CLICOLOR = 1;
                                EDITOR = "nvim";
                                PAGER = "less";
                            };
                            programs.bat.enable = true;
                            programs.bat.config.theme = "TwoDark";
                            programs.fzf.enable = true;
                            programs.fzf.enableZshIntegration = true;
                            programs.exa.enable = true;
                            programs.git.enable = true;
                            programs.zsh.enable = true;
                            programs.zsh.enableAutosuggestions = true;
                            programs.zsh.enableCompletion = true;
                            programs.zsh.enableSyntaxHighlighting = true;
                            programs.zsh.shellAliases = {
                                ls = "ls --color=auto -F";
                            };
                            programs.starship.enable = true;
                            programs.starship.enableZshIntegration = true;
                            # programs.alacritty = {
                            #     enable = true
                            #     # ...
                            # };
                        })
                    ];
                };
            ];
        };
    };
}
