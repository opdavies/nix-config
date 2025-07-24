{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        git-exclude
        git-extras
        git-graph
        git-trim
        stable.git-instafix
      ];
    };
}
