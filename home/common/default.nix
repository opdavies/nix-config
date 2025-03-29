{
  outputs,
  hostname,
  username,
  ...
}:

{
  imports = builtins.attrValues outputs.homeManagerModules ++ [
    ../../home/${username}/hosts/${hostname}.nix
  ];
}
