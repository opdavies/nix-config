{ pkgs }:

pkgs.writeShellApplication {
  name = "unmounter";

  runtimeInputs = with pkgs; [
    cryptsetup
    dmenu
    gawk
    libnotify
    util-linux
  ];

  text = ''
    lsblk_output="$(lsblk -nrpo "name,type,size,mountpoint")"
    mounted_drives="$(echo "$lsblk_output" | awk '($2=="part"||$2="crypt")&&$4!~/\/boot|\/home$|SWAP/&&length($4)>1{printf "%s (%s)\n",$4,$3}')"

    all_unmountable="$(echo "$mounted_drives" | sed "/^$/d;s/ *$//")"
    test -n "$all_unmountable"

    selected="$(echo "$all_unmountable" | dmenu -i -p "Unmount which drive?")"
    selected="''${selected%% *}"
    test -n "$selected"

    sudo -A umount -l "/''${selected#*/}"
    notify-send "Device unmounted" "$selected has been unmounted."

    # Close the selected drive if decrypted.
    cryptid="$(echo "$lsblk_output" | grep "/''${selected#*/}$")"
    cryptid="''${cryptid%% *}"
    test -b /dev/mapper/"''${cryptid##*/}"
    sudo -A cryptsetup close "$cryptid"

    notify-send "Device dencryption closed" "Drive is now securely locked again."
  '';
}
