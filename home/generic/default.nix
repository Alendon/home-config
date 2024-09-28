{ config, lib, pkgs, specialArgs, ...}:
let
  username = "alex";
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

  inherit (specialArgs) hostname role;
  inherit (pkgs.stdenv) isLinux isDarwin;
  homeDir = if isDarwin then "/Users/" else "/home/";
  if-exists = f: builtins.pathExists f;
  existing-imports = imports: builtins.filter if-exists imports;
in
{
  imports = [

  ] ++ existing-imports [
    ./hostname/${hostname}
    ./hostname/${hostname}.nix
    ./role/${role}
    ./role/${role}.nix
  ];

  home = {
    homeDirectory = homeDir+username;
    inherit username;

    packages = with pkgs;
    [

    ]
    ++ lib.optionals ( role == "workstation" || role == "server" )
    [

    ];
  };

  programs = {
    git = {
      userEmail = email;
    };
  };
}
