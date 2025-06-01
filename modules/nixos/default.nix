{
  imports = [
    ./cli/docker.nix
    ./cli/kanata.nix
    ./cli/podman.nix
    ./cli/password-store.nix

    ./core/avahi.nix
    ./core/bluetooth.nix
    ./core/gnupg.nix
    ./core/openssh.nix
    ./core/pipewire.nix
    ./core/xbanish.nix
    ./core/zram.nix

    ./desktop/dconf.nix
    ./desktop/dwm
    ./desktop/fonts.nix
    ./desktop/media
    ./desktop/st.nix
    ./desktop/thunar.nix

    ./homelab/gitea-actions-runner.nix

    ./nixpad
  ];
}
