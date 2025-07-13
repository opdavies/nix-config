{ pkgs }:

pkgs.writeShellApplication {
  name = "import-to-jellyfin";

  runtimeInputs = with pkgs; [ coreutils ];

  text = ''
    source_path="/home/opdavies/import"

    mapfile -t files < <(find "$source_path" -type f -name "*.mp4")

    for filepath in "''${files[@]}"; do
      echo "Moving $filepath..."

      filename="$(basename "$filepath")"
      filename_without_extension="''${filename%.mp4}"

      destination_path="/mnt/media/jellyfin/Movies/$filename_without_extension"
      mkdir -p "$destination_path"

      mv "$source_path/$filename" "$destination_path"
    done

    chown -R jellyfin:media /mnt/media/jellyfin
  '';
}
