let
  username = "luke";
in
{
  users.users.${username} = {
    description = "Luke Davies";
    extraGroups = [ ];
    initialPassword = username;
    isNormalUser = true;
    packages = [ ];
  };
}
