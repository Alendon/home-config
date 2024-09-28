{ config, lib, pkgs, specialArgs, ...}:
let
  inherit (specialArgs) displays display_center display_left display_right role;
in
with lib;
{
  host = {
    home = {
      applications = {
        act.enable = mkDefault true;
        avidemux.enable = true;
        cura.enable = true;
        czkawka.enable = mkDefault true;
        encfs.enable = true;
        github-client.enable = true;
        hadolint.enable = true;
        hugo.enable = false;
        lazygit.enable = true;
        mp3gain.enable = mkDefault true;
        mqtt-explorer.enable = true;
        nix-development_tools.enable = true;
        nmap.enable = mkDefault true;
        msteams.enable = false;
        obsidian.enable = true;
        opensnitch-ui.enable = true;
        python.enable = true;
        shellcheck.enable = true;
        shfmt.enable = true;
        smartgit.enable = false;
        ssh.enable = true;
        thunderbird.enable = mkDefault true;
        visual-studio-code = {
          enable = mkDefault true;
          defaultApplication.enable = mkDefault true;
        };
        zoom.enable = true;
        zenbrowser.enable = true;
      };
      feature = {
        emulation = {
          windows.enable = true;
        };
        gui = {
          enable = true;
          displayServer = "wayland";
          windowManager = "hyprland";
        };
      };
      service.decrypt_encfs_workspace.enable = true;
      user = {
        dave = {
          secrets = {
            act = {
              toi.enable = true;
            };
            github = {
              toi.enable = true;
            };
            ssh = {
              sd.enable = true;
              sr.enable = true;
              toi.enable = true;
            };
          };
        };
      };
    };
  };
}