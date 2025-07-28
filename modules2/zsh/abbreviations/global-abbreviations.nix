{
  flake.modules.homeManager.base.programs.zsh.zsh-abbr.globalAbbreviations = {
    A1 = "| awk '{print $1}'";
    C = "| xclip -sel clip";
    Fj = "| jq .";
    Fy = "| yq .";
    G = "| grep";
    GH = "| grep HTTP";
    Gi = "| grep -i";
    H2 = "| head -n 20";
    H = "| head";
    L = "| less";
    V = "| nvim -";
    X = "| xargs -I1";
  };
}
