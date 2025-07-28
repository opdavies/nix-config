{
  flake.modules.homeManager.base.programs.zsh.zsh-abbr.abbreviations = {
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

    f = "find .";
    fd = "find . -type d";
    fdn = "find . -type d -name";
    ff = "find . -type f";
    ffn = "find . -type f -name";

    g = "git";
    ga = "git add";
    gan = "git add -N";
    gap = "git add -p";
    gb = "git branch";
    gba = "git branch --all";
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
    glg = "git log --grep";
    glo = "git log --oneline";
    glog = "git log --oneline --grep";
    glos = "git log --oneline -S";
    gls = "git log -S";
    gm = "git merge";
    gmf = "git merge --ff";
    gmnf = "git merge --no-ff";
    gp = "git push";
    gpa = "git push acquia";
    gpam = "git push acquia main";
    gpap = "git push acquia HEAD:production";
    gpf = "git push --force-with-lease";
    gpfo = "git push --force-with-lease origin";
    gpl = "git pull";
    gplr = "git pull --rebase";
    gpo = "git push origin";
    gpom = "git push origin main";
    gpt = "git push --tags";
    gr = "git rebase";
    gra = "git rebase --abort";
    grc = "git rebase --continue";
    gri = "git rebase -i";
    gs = "git status";
    gsh = "git show";
    gst = "git stash";
    gstp = "git stash pop";
    gt = "git tag";

    j = "just";
    jb = "just build";
    jt = "just test";
    js = "just switch";

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

    nah = "git reset --hard; git clean -fd";
    wip = "git commit -m wip";

    dv = "devenv";
    dvi = "devenv info";
    dvp = "devenv processes";
    dvs = "devenv shell";
    dvt = "devenv tasks";
    dvu = "devenv up";

    c = "composer";
    ci = "composer install";
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

    sg = "vendor/bin/sculpin generate";
    sge = "vendor/bin/sculpin generate --env";
    sgs = "vendor/bin/sculpin generate --server";
    sgsp = "vendor/bin/sculpin generate --server --port";
    sgsw = "vendor/bin/sculpin generate --server --watch";
    sgswp = "vendor/bin/sculpin generate --server --watch --port";
  };
}
