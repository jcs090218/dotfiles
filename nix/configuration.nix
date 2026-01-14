{ config, pkgs, system, self, ... }:
let
  inherit (self) inputs;
in
{
  nixpkgs.config.allowUnfree = true;

  imports =
    [
      self.inputs.home-manager.nixosModules.home-manager
      ./internal/overlays.nix
      #./internal/boot.nix
      #./internal/hardware.nix
      #./internal/desktop.nix
      #./internal/cli.nix
      #./internal/samba.nix
      ./internal/misc.nix
    ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit self system;
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
    "qtwebengine-5.15.19"
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.printing.enable = true;

  users.users.jenchieh = {
    isNormalUser = true;
    extraGroups = [
      "jenchieh"
      "wheel"
      "docker"
      "fido"
      "gamemode"
      "networkmanager"
      "vboxusers"
      "video"
      "audio"
      "sound"
      "adbusers"
      "input"
    ];

    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  security.sudo.extraRules= [
    {  users = [ "jenchieh" ];
       commands = [
         { command = "ALL" ;
           options= [ "NOPASSWD" ];
         }
       ];
    }
  ];

  nix = {
    settings.allowed-users = [ "jenchieh" ];
    settings.trusted-users = [ "root" "jenchieh" ];
    nixPath = [
      "nixpkgs=${self.inputs.nixpkgs}"
    ];

    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "25.11";
}
