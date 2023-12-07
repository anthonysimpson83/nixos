{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];
  programs.kitty.enable = true;
  programs.kitty.theme = "Brogrammer";
  programs.kitty.settings = {
    background_opacity = lib.mkForce "0.65";
  };
}
