let
  username = "eric";
in
{
  users.users.${username} = {
    description = "Eric Davies";
    extraGroups = [ ];
    initialPassword = "eric";
    isNormalUser = true;
    packages = [ ];
  };
}
