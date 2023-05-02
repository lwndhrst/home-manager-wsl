{ config, pkgs, ... }:

let 
  modules = import ./modules;

in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = with modules; [
    neovim
    tex
    tmux
    zathura
  ];

  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = "leon";
    homeDirectory = "/home/leon";

    packages = with pkgs; [
      fd
      gcc
      gh
      git
      htop
      libqalculate
      nitch
      ranger
      ripgrep
      stylua
      tree-sitter
      unzip
      wget
    ];

    sessionVariables = { };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.11";
  };
}