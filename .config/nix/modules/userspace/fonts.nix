{config, lib, pkgs, ...}:
let
  cfg = config.custom.fonts;
in
  {
    options = {
      custom.fonts.enable = lib.mkEnableOption "Install fonts";
    };

    config = lib.mkIf cfg.enable {
      # List of fonts to install
      fonts.packages = with pkgs; [
	dm-fonts
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-emoji
	nerd-fonts.fira-code
      ];
    };
  }
