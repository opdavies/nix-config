{
  home.file.".gnupg/gpg-agent.conf".text = ''
    allow-preset-passphrase
    default-cache-ttl 600
    max-cache-ttl 7200
    enable-ssh-support
  '';
}
