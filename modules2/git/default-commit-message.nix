{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      home.file."${config.xdg.configHome}/git/message".text = ''


        # Description
        #
        # - Why is this change necessary?
        # - How does it address the issue?
        # - What side effects does this change have?
        #
        # For breaking changes, uncomment the following line and describe the change:
        #
        # BREAKING CHANGE:
        #
        #
        # Add any issue IDs or commit SHAs that this commit references:
        #
        # Refs:

      '';
    };
}
