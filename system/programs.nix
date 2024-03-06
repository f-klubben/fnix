{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neofetch
        lynx
        tmux
    ];
}
