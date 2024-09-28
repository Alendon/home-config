{ config, lib, pkgs, specialArgs, ...}:
let
  inherit (specialArgs) username;

  _f = "Alex";
  _g = "ander";
  _h = "Pani";
  _l = "ck";
  s = "li";
  _p = "ve";
  _a = "do";
  a_ = ".";
  p_ = "de";

  email = "${_f}${_g}${_a}${_h}${_l}@${s}${_p}${_a}${a_}${p_}";
in
  with lib;
{
  host = {
    home = {
      applications = {
        git.enable = mkDefault true;
      };
    };
  };

  programs = {
    git = {
      userEmail = email;
    };
  };
}
