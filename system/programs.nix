{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neofetch
        lynx
        vim
        wget
        bat
    ];
}
