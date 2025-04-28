{
  services.mastodon = {
    enable = true;

    configureNginx = true;
    localDomain = "social.oliverdavies.uk";
    streamingProcesses = 3;

    extraConfig = {
      SINGLE_USER_MODE = "true";
    };

    smtp = {
      fromAddress = "social@oliverdavies.uk";
    };
  };
}
