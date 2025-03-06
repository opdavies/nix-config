{
  cl = "clear";
  cs = "create-script";
  daily = "run create-daily next";
  rst = "rst2pdf";
  st = "source .tmux";
  sz = "source ~/.config/zsh/.zshrc";
  ti = "timer";
  uagr = "update-all-git-repos";
  v = "nvim";
  yt = "yt-dlp";

  evl = "export-video-list";
  vv = "cat ~/Documents/videos.json";

  g = "git";
  ga = "git add";
  gan = "git add -N";
  gap = "git add -p";
  gb = "git branch";
  gbl = "git blame";
  gc = "git commit";
  gca = "git commit --amend";
  gcan = "git commit --amend --no-edit";
  gcl = "git clone";
  gcm = "git commit -m";
  gco = "git checkout";
  gcob = "git checkout -b";
  gd = "git diff";
  gds = "git diff --staged";
  gf = "git fetch";
  gfa = "git fetch --all";
  gl = "git log";
  glo = "git log --oneline";
  gls = "git log --stat";
  gm = "git merge";
  gmf = "git merge --ff";
  gmnf = "git merge --no-ff";
  gp = "git push";
  gpa = "git push acquia";
  gpam = "git push acquia main";
  gpap = "git push acquia HEAD:production";
  gpl = "git pull";
  gplr = "git pull --rebase";
  gpo = "git push origin";
  gpom = "git push origin main";
  gr = "git rebase";
  gra = "git rebase --abort";
  grc = "git rebase --continue";
  gri = "git rebase -i";
  gs = "git status";
  gsh = "git show";
  gst = "git stash";
  gstp = "git stash pop";

  # tmux
  ta = "tmux attach";
  tl = "tmux list-sessions";
  tk = "tmux kill-session";

  # Docker and Docker Compose.
  dk = "docker";
  dkp = "docker ps";
  dkpa = "docker ps -a";
  dkpaq = "docker ps -a -q";
  dkb = "docker build -t";
  dks = "docker start";
  dkt = "docker stop";
  dkrm = "docker rm";
  dkri = "docker rmi";
  dke = "docker exec -ti";
  dkl = "docker logs -f";
  dki = "docker images";
  dkpu = "docker pull";
  dkph = "docker push";
  dkbnc = "docker build --no-cache -t";
  dkr = "docker run --rm";
  dkrti = "docker run --rm -ti";
  dkc = "docker compose";
  dkcb = "docker compose build";
  dkcu = "docker compose up";
  dkclean = "docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi";

  # Nix and direnv.
  dea = "direnv allow";
  dee = "direnv edit";
  nxf = "nix flake";
  nxfc = "nix flake check";
  nxfs = "nix flake show";
  nxfu = "nix flake update";
  nxr = "nix run nixpkgs#%";
  nxs = "nix shell nixpkgs#%";

  # run scripts.
  r = "run";
  rc = "run composer";
  rcda = "run composer dump-autoload";
  rci = "run composer install";
  rcr = "run composer require";
  rcu = "run composer update";
  rd = "run drush";
  rdce = "run drush config:export -y";
  rdci = "run drush config:import -y";
  rdcr = "run drush cache:rebuild";
  rdscr = "run drush php:script";
  rduli = "run drush uli";
  rdup = "run drush updatedb -y";
  rpub = "run publish";
  rt = "run test";

  "-g A1" = "| awk '{print $1}'";
  "-g C" = "| xclip -sel clip";
  "-g Fj" = "| jq .";
  "-g Fy" = "| yq .";
  "-g G" = "| grep";
  "-g GH" = "| grep HTTP";
  "-g Gi" = "| grep -i";
  "-g H2" = "| head -n 20";
  "-g H" = "| head";
  "-g L" = "| less";
  "-g V" = "| nvim -";
  "-g X" = "| xargs -I1";

  nah = "git reset --hard; git clean -fd";
  wip = "git commit -m wip";

  dv = "devenv";
  dvi = "devenv info";
  dvp = "devenv processes";
  dvs = "devenv shell";
  dvt = "devenv tasks";
  dvu = "devenv up";

  c = "composer";
  cr = "composer require";
  crd = "composer require drupal/%";
  cu = "composer update";
  cul = "composer update --lock";
  cw = "composer why";
  cwn = "composer why-not";

  d = "drush";
  dce = "drush config:export -y";
  dci = "drush config:import -y";
  dcr = "drush cache:rebuild";
  den = "drush pm:enable -y";
  deu = "drush pm:uninstall";
  dscr = "drush php:script";
  duli = "drush uli";
  dup = "drush updatedb -y";
}
