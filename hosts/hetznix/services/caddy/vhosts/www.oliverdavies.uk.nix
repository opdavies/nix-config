{
  services.caddy.virtualHosts = {
    "oliverdavies.uk" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = ''
        redir https://www.oliverdavies.uk{uri}
      '';
    };

    "www.oliverdavies.uk" = {
      useACMEHost = "oliverdavies.uk";

      extraConfig = ''
        encode gzip

        root * /var/www/vhosts/www.oliverdavies.uk

        file_server {
          disable_canonical_uris
        }

        # Remove trailing slashes from all URLs.
        @trailingSlash {
          path_regexp trailingSlash ^(.*)/$
          not path /
        }
        redir @trailingSlash {http.regexp.trailingSlash.1} temporary

        handle_errors {
          @404 {
            expression {http.error.status_code} == 404
          }

          rewrite @404 /404/index.html
          file_server
        }

        @articles path_regexp ^/articles/(.*)$
        @talks path_regexp ^/talks/(.*)$
        @talks-archive path_regexp ^/talks/archive/(.*)$

        # Exclude /daily/page/{number} from the /archive/* redirection
        @excludeArchivePages {
          path_regexp ^/archive/page/\d+$
        }

        @old-dailies {
          path_regexp oldDailies ^/archive/(.*)$
          not path_regexp ^/archive/page/\d+$
        }

        redir @articles /blog/{re.1} permanent
        redir @old-dailies /daily/{re.1} permanent
        redir @talks-archive /presentations/{re.1} permanent
        redir @talks /presentations/{re.1} permanent

        redir /10-useful-drupal-6-modules-i-use-every-project /blog/10-useful-drupal-6-modules permanent
        redir /2010/04/05/styling-drupal-6s-taxonomy-lists-with-php-css-and-jquery /blog/style-drupal-6s-taxonomy-lists-php-css-jquery permanent
        redir /2010/04/28/using-imagecache-and-imagecrop-for-my-portfolio /blog/using-imagecache-imagecrop-my-portfolio permanent
        redir /2010/05/29/importing-images-using-the-imagefieldimport-module /blog/quickly-import-multiples-images-using-imagefieldimport-module permanent
        redir /2010/06/23/creating-a-block-of-social-media-icons-using-cck-views-and-nodequeue /blog/create-block-social-media-icons-using-cck-views-nodequeue permanent
        redir /2010/07/05/thanks /blog/thanks permanent
        redir /2010/08/17/create-a-better-photo-gallery-in-drupal-part-2 /blog/create-better-photo-gallery-drupal-part-2 permanent
        redir /2014/05/21/git-format-patch /blog/git-format-patch-your-friend permanent
        redir /2PxmyqP /articles/examples-of-laravel-collections-in-drupal permanent
        redir /39CoG /articles/drupalcamp-london-testing-workshop permanent
        redir /3eGQr https://github.com/howToCodeWell/howToCodeWellFM/blob/c927e0b3589f1d7375002f7fd70f0bfc9fc90449/composer.json#L17 permanent
        redir /6UhLN https://github.com/opdavies/sculpin-twig-markdown-bundle/pull/1 permanent
        redir /6i3YZ https://www.youtube.com/watch?v=vUK5sEbd-dk permanent
        redir /9rv0Z https://www.drupal.org/project/override_node_options/issues/3109852 permanent
        redir /BhMZi https://git.drupalcode.org/search?utf8=%E2%9C%93&snippets=&scope=&repository_ref=8.x-1.x&search=baz&project_id=23203 permanent
        redir /NBi5h https://git.drupalcode.org/search?utf8=%E2%9C%93&search=bar&group_id=&project_id=23203&search_code=true&repository_ref=8.x-1.x&nav_source=navbar permanent
        redir /P5KQ5 https://www.npmjs.com/package/tailwindcss-skip-link permanent
        redir /S8ZDA /articles/rebuilding-bartik-with-vuejs-tailwind-css-part-2 permanent
        redir /Wh48P https://github.com/opdavies/oliverdavies.uk/blob/master/source/_partials/talk/video.html.twig permanent
        redir /XbzS2 https://github.com/opdavies/gmail-filter-builder permanent
        redir /YK1VH /articles/psr4-autoloading-test-cases-drupal-7 permanent
        redir /YilTZ$ https://drupalcamp.london/tickets/training permanent
        redir /about / permanent
        redir /about/cv /cv permanent
        redir /about/speaker-information /speaker-information permanent
        redir /about/speaker /speaker permanent
        redir /acquia-certifications https://certification.acquia.com/registry?fname=Oliver&lname=Davies&city=&state=&country=United+Kingdom&org=&exam=All permanent
        redir /acquia-certified https://certification.acquia.com/?fname=Oliver&lname=Davies permanent
        redir /ansible-molecule /articles/test-driven-ansible-role-development-molecule permanent
        redir /ansible https://galaxy.ansible.com/opdavies permanent
        redir /ansistrano-code https://github.com/opdavies/dransible permanent
        redir /ansistrano-demo https://www.youtube.com/watch?v=PLS4ET7FAcU permanent
        redir /ansistrano-slides /talks/deploying-php-ansible-ansistrano permanent
        redir /archive/2022/10/20/run-vs-task-runners/? /archive/2022/10/19/run-vs-task-runners permanent
        redir /atNOQ https://youtu.be/r41dkD2EOo8 permanent
        redir /automatically-updating-talk-created-date https://gist.github.com/opdavies/4e75e1753d8603113f07f8264bb783d6 permanent
        redir /blog.xml /rss.xml permanent
        redir /blog/10-useful-drupal-6-modules /blog/useful-drupal-6-modules permanent
        redir /blog/10-years-working-full-time-drupal /blog/10-years-working-full-time-drupal-php permanent
        redir /blog/2010/04/05/style-drupal-6s-taxonomy-lists-php-css-and-jquery /blog/style-drupal-6s-taxonomy-lists-php-css-and-jquery permanent
        redir /blog/2010/04/05/styling-drupal-6s-taxonomy-lists-with-php-css-and-jquery /blog/style-drupal-6s-taxonomy-lists-php-css-jquery permanent
        redir /blog/2010/04/28/using-imagecache-and-imagecrop-my-portfolio /blog/using-imagecache-and-imagecrop-my-portfolio permanent
        redir /blog/2010/05/06/conditional-email-addresses-webform /blog/conditional-email-addresses-webform permanent
        redir /blog/2010/05/10/quickly-create-zen-subthemes-using-zenophile /blog/quickly-create-zen-subthemes-using-zenophile permanent
        redir /blog/2010/05/25/create-slideshow-multiple-images-using-fancy-slide /blog/create-slideshow-multiple-images-using-fancy-slide permanent
        redir /blog/2010/05/29/quickly-import-multiples-images-using-imagefieldimport-module /blog/quickly-import-multiples-images-using-imagefieldimport-module permanent
        redir /blog/2010/06/02/improve-jpg-quality-imagecache-and-imageapi /blog/improve-jpg-quality-imagecache-and-imageapi permanent
        redir /blog/2010/06/23/create-block-social-media-icons-using-cck-views-and-nodequeue /blog/create-block-social-media-icons-using-cck-views-and-nodequeue permanent
        redir /blog/2010/06/25/10-useful-drupal-6-modules /blog/10-useful-drupal-6-modules permanent
        redir /blog/2010/06/28/create-flickr-photo-gallery-using-feeds-cck-and-views /blog/create-flickr-photo-gallery-using-feeds-cck-and-views permanent
        redir /blog/2010/07/01/change-content-type-multiple-nodes-using-sql /blog/change-content-type-multiple-nodes-using-sql permanent
        redir /blog/2010/07/02/create-virtual-hosts-mac-os-x-using-virtualhostx /blog/create-virtual-hosts-mac-os-x-using-virtualhostx permanent
        redir /blog/2010/07/07/add-taxonomy-term-multiple-nodes-using-sql /blog/add-taxonomy-term-multiple-nodes-using-sql permanent
        redir /blog/2010/07/07/quickly-adding-taxonomy-term-multiple-nodes-using-sql /blog/add-taxonomy-term-multiple-nodes-using-sql permanent
        redir /blog/2010/07/12/overview-teleport-module /blog/review-teleport-module permanent
        redir /blog/2010/07/12/review-teleport-module /blog/review-teleport-module permanent
        redir /blog/2010/08/10/review-adminhover-module /blog/review-adminhover-module permanent
        redir /blog/2010/08/11/create-better-photo-gallery-drupal-part-1 /blog/create-better-photo-gallery-drupal-part-1 permanent
        redir /blog/2010/08/11/how-create-better-photo-gallery-drupal-part-1 /blog/create-better-photo-gallery-drupal-part-1 permanent
        redir /blog/2010/08/17/create-better-photo-gallery-drupal-part-2 /blog/create-better-photo-gallery-drupal-part-2 permanent
        redir /blog/2010/08/20/review-image-caption-module /blog/review-image-caption-module permanent
        redir /blog/2010/09/26/south-wales-drupal-user-group /blog/south-wales-drupal-user-group permanent
        redir /blog/2010/10/10/create-and-apply-patches /blog/create-and-apply-patches permanent
        redir /blog/2010/10/13/create-better-photo-gallery-drupal-part-3 /blog/create-better-photo-gallery-drupal-part-3 permanent
        redir /blog/2010/10/22/create-better-photo-gallery-drupal-part-21 /blog/create-better-photo-gallery-drupal-part-21 permanent
        redir /blog/2010/11/04/use-regular-expressions-search-and-replace-coda-or-textmate /blog/use-regular-expressions-search-and-replace-coda-or-textmate permanent
        redir /blog/2011/02/14/easily-embed-typekit-fonts-your-drupal-website /blog/easily-embed-typekit-fonts-your-drupal-website permanent
        redir /blog/2011/03/15/display-number-facebook-fans-php /blog/display-number-facebook-fans-php permanent
        redir /blog/2011/03/31/proctor-stevenson /blog/proctor-stevenson permanent
        redir /blog/2011/05/20/proctors-hosting-next-drupal-meetup /blog/proctors-hosting-next-drupal-meetup permanent
        redir /blog/2011/05/23/imagefield-import-archive /blog/imagefield-import-archive permanent
        redir /blog/2011/08/28/create-multigroups-drupal-7-using-field-collections /blog/create-multigroups-drupal-7-using-field-collections permanent
        redir /blog/2011/10/19/install-and-configure-subversion-svn-server-ubuntu /blog/install-and-configure-subversion-svn-server-ubuntu permanent
        redir /blog/2011/10/install-and-configure-subversion-svn-server-ubuntu /blog/how-install-configure-subversion-svn-server-ubuntu permanent
        redir /blog/2012/01/04/site-upgraded-drupal-7 /blog/site-upgraded-drupal-7 permanent
        redir /blog/2012/02/01/use-authorize-keys-create-passwordless-ssh-connection /blog/use-authorized-keys-create-passwordless-ssh-connection permanent
        redir /blog/2012/04/16/create-omega-subtheme-less-css-preprocessor-using-omega-tools-and-drush /blog/create-omega-subtheme-less-css-preprocessor-using-omega-tools-and-drush permanent
        redir /blog/2012/04/17/installing-nagios-centos /blog/installing-nagios-centos permanent
        redir /blog/2012/04/19/adding-custom-theme-templates-drupal-7 /blog/adding-custom-theme-templates-drupal-7 permanent
        redir /blog/2012/04/adding-custom-theme-templates-drupal-7 /blog/adding-custom-theme-templates-drupal-7 permanent
        redir /blog/2012/05/23/add-date-popup-calendar-custom-form /blog/add-date-popup-calendar-custom-form permanent
        redir /blog/2012/05/23/checkout-specific-revision-svn-command-line /blog/checkout-specific-revision-svn-command-line permanent
        redir /blog/2012/05/23/forward-one-domain-another-using-mod-rewrite-and-htaccess /blog/forward-one-domain-another-using-mod-rewrite-and-htaccess permanent
        redir /blog/2012/05/23/forward-one-domain-another-using-modrewrite-and-htaccess /blog/forward-one-domain-another-using-modrewrite-htaccess permanent
        redir /blog/2012/05/23/prevent-apache-displaying-text-files-within-web-browser /blog/prevent-apache-displaying-text-files-within-web-browser permanent
        redir /blog/2012/05/23/writing-info-file-drupal-7-theme /blog/writing-info-file-drupal-7-theme permanent
        redir /blog/2012/05/24/dividing-drupals-process-and-preprocess-functions-separate-files /blog/dividing-drupals-process-and-preprocess-functions-separate-files permanent
        redir /blog/2012/05/forward-one-domain-another-using-modrewrite-and-htaccess /blog/forward-one-domain-another-using-modrewrite-htaccess permanent
        redir /blog/2012/07/12/my-new-drupal-modules /blog/my-new-drupal-modules permanent
        redir /blog/2012/07/14/install-nomensa-media-player-drupal /blog/install-nomensa-media-player-drupal permanent
        redir /blog/2012/07/27/writing-article-linux-journal /blog/writing-article-linux-journal permanent
        redir /blog/2012/07/install-and-configure-nomensa-accessible-media-player-drupal /blog/install-configure-nomensa-accessible-media-player-drupal permanent
        redir /blog/2012/07/nomensa-accessible-media-player-drupal /blog/install-configure-nomensa-accessible-media-player-drupal permanent
        redir /blog/2012/08/18/display-custom-menu-drupal-7-theme-template-file /blog/display-custom-menu-drupal-7-theme-template-file permanent
        redir /blog/2012/09/06/reflections-speaking-unifieddiff /blog/reflections-speaking-unifieddiff permanent
        redir /blog/2012/10/25/my-sublime-text-2-settings /blog/my-sublime-text-2-settings permanent
        redir /blog/2012/11/15/accessible-bristol-site-launched /blog/accessible-bristol-site-launched permanent
        redir /blog/2012/11/17/open-sublime-text-2-mac-os-x-command-line /blog/open-sublime-text-2-mac-os-x-command-line permanent
        redir /blog/2012/12/06/use-sass-and-compass-drupal-7-using-sassy /blog/use-sass-and-compass-drupal-7-using-sassy permanent
        redir /blog/2012/12/use-sass-and-compass-drupal-7-using-sassy /blog/use-sass-and-compass-drupal-7-using-sassy permanent
        redir /blog/2013/01/09/checking-if-user-logged-drupal-right-way /blog/checking-if-user-logged-drupal-right-way permanent
        redir /blog/2013/02/16/creating-and-using-custom-tokens-drupal-7 /blog/creating-and-using-custom-tokens-drupal-7 permanent
        redir /blog/2013/02/creating-and-using-custom-tokens-drupal-7 /blog/creating-using-custom-tokens-drupal-7 permanent
        redir /blog/2013/03/02/quickest-way-install-sublime-text-2-ubuntu /blog/quickest-way-install-sublime-text-2-ubuntu permanent
        redir /blog/2013/04/20/leaving-nomensa-joining-precedent /blog/leaving-nomensa-joining-precedent permanent
        redir /blog/2013/04/27/display-git-branch-or-tag-names-your-bash-prompt /blog/display-git-branch-or-tag-names-your-bash-prompt permanent
        redir /blog/2013/04/display-git-branch-or-tag-names-your-bash-prompt /blog/display-git-branch-or-tag-names-your-bash-prompt permanent
        redir /blog/2013/06/13/some-useful-links-using-simpletest-drupal /blog/some-useful-links-using-simpletest-drupal permanent
        redir /blog/2013/07/17/creating-local-and-staging-sites-drupals-domain-module-enabled /blog/creating-local-and-staging-sites-drupals-domain-module-enabled permanent
        redir /blog/2013/07/26/going-drupalcon /blog/going-drupalcon permanent
        redir /blog/2013/09/06/create-a-zen-sub-theme-using-drush /blog/create-a-zen-sub-theme-using-drush permanent
        redir /blog/2013/09/create-zen-sub-theme-using-drush /blog/create-zen-sub-theme-using-drush permanent
        redir /blog/2013/11/19/dont-bootstrap-drupal-use-drush /blog/dont-bootstrap-drupal-use-drush permanent
        redir /blog/2013/11/27/useful-vagrant-commands /blog/useful-vagrant-commands permanent
        redir /blog/2013/11/dont-bootstrap-drupal-use-drush /blog/dont-bootstrap-drupal-use-drush permanent
        redir /blog/2013/12/24/quickly-apply-patches-using-git-and-curl-or-wget /blog/quickly-apply-patches-using-git-and-curl-or-wget permanent
        redir /blog/2013/12/31/download-different-versions-drupal-drush /blog/download-different-versions-drupal-drush permanent
        redir /blog/2013/12/quickly-apply-patches-using-git-and-curl-or-wget /blog/quickly-apply-patches-using-git-curl-or-wget permanent
        redir /blog/2014/01/15/some-useful-git-aliases /blog/some-useful-git-aliases permanent
        redir /blog/2014/02/09/drupalcamp-london-2014 /blog/drupalcamp-london-2014 permanent
        redir /blog/2014/03/03/what-git-flow /blog/what-git-flow permanent
        redir /blog/2014/05/03/drupal-association /blog/drupal-association permanent
        redir /blog/2014/05/06/thanks /blog/thanks permanent
        redir /blog/2014/05/21/git-format-patch /blog/git-format-patch permanent
        redir /blog/2014/07/02/drush-make-drupalbristol /blog/drush-make-drupalbristol permanent
        redir /blog/2014/10/06/fix-vagrant-loading-wrong-virtual-machine /blog/fix-vagrant-loading-wrong-virtual-machine permanent
        redir /blog/2014/10/21/updating-features-and-adding-components-using-drush /blog/updating-features-and-adding-components-using-drush permanent
        redir /blog/2014/11/18/include-css-fonts-using-sass-each-loop /blog/include-css-fonts-using-sass-each-loop permanent
        redir /blog/2014/11/20/using-remote-files-when-developing-locally-with-stage-file-proxy-module /blog/using-remote-files-when-developing-locally-with-stage-file-proxy-module permanent
        redir /blog/2014/11/27/pantheon-settings-files /blog/pantheon-settings-files permanent
        redir /blog/2014/12/20/include-local-drupal-settings-file-environment-configuration-and-overrides /blog/include-local-drupal-settings-file-environment-configuration-and-overrides permanent
        redir /blog/2015/04/03/how-to-define-a-minimum-drupal-core-version /blog/how-to-define-a-minimum-drupal-core-version permanent
        redir /blog/2015/06/18/updating-forked-repositories-on-github /blog/updating-forked-repositories-on-github permanent
        redir /blog/2015/07/19/sculpin-twig-resources /blog/sculpin-twig-resources permanent
        redir /blog/2015/07/21/automating-sculpin-jenkins /blog/automating-sculpin-jenkins permanent
        redir /blog/2015/12/22/programmatically-load-an-entityform-in-drupal-7 /blog/programmatically-load-an-entityform-in-drupal-7 permanent
        redir /blog/2016/02/15/announcing-the-drupal-vm-generator /blog/announcing-the-drupal-vm-generator permanent
        redir /blog/2016/05/03/simplifying-drupal-migrations-with-xautoload /blog/simplifying-drupal-migrations-with-xautoload permanent
        redir /blog/2016/07/15/building-gmail-filters-with-php /blog/building-gmail-filters-with-php permanent
        redir /blog/2016/12/30/drupal-vm-generator-291-released /blog/drupal-vm-generator-291-released permanent
        redir /blog/2017/01/07/easier-sculpin-commands-with-composer-and-npm-scripts /blog/easier-sculpin-commands-with-composer-and-npm-scripts permanent
        redir /blog/2017/01/31/nginx-redirects-with-query-string-arguments /blog/nginx-redirects-with-query-string-arguments permanent
        redir /blog/2017/05/05/fixing-drupal-simpletest-docker /blog/2017/05/05/fixing-drupal-simpletest-issues-inside-docker-containers permanent
        redir /blog/2017/05/05/fixing-drupal-simpletest-issues-inside-docker-containers /blog/fixing-drupal-simpletest-issues-inside-docker-containers permanent
        redir /blog/2017/05/20/turning-drupal-module-into-feature /blog/turning-your-custom-drupal-module-feature permanent
        redir /blog/2017/06/09/introducing-the-drupal-meetups-twitterbot /blog/introducing-the-drupal-meetups-twitterbot permanent
        redir /blog/2017/07/13/publishing-sculpin-sites-with-github-pages /blog/publishing-sculpin-sites-github-pages permanent
        redir /blog/2017/11/07/tdd-test-driven-drupal /blog/tdd-test-driven-drupal permanent
        redir /blog/2017/11/07/writing-drupal-module-test-driven-development-tdd /blog/2017/11/07/tdd-test-driven-drupal permanent
        redir /blog/2018/01/30/drupalcamp-bristol-2018 /blog/drupalcamp-bristol-2018 permanent
        redir /blog/2018/02/05/using-tailwind-css-in-your-drupal-theme /blog/using-tailwind-css-in-your-drupal-theme permanent
        redir /blog/2018/02/27/looking-forward-to-drupalcamp-london /blog/looking-forward-to-drupalcamp-london permanent
        redir /blog/2018/02/27/queuing-private-messages-in-drupal-8 /blog/queuing-private-messages-in-drupal-8 permanent
        redir /blog/2018/02/28/building-the-new-phpsw-website /blog/building-the-new-phpsw-website permanent
        redir /blog/2018/03/02/yay-the-mediacurrent-contrib-half-hour-is-back /blog/yay-the-mediacurrent-contrib-half-hour-is-back permanent
        redir /blog/2018/03/04/tweets-from-drupalcamp-london /blog/tweets-from-drupalcamp-london permanent
        redir /blog/2018/04/23/back-to-the-future-git-diff-apply /blog/back-future-gits-diff-apply-commands permanent
        redir /blog/2018/05/06/creating-a-custom-phpunit-command-for-docksal /blog/creating-a-custom-phpunit-command-for-docksal permanent
        redir /blog/add-date-popup-calendar-custom-form /blog/how-add-date-popup-calendar-custom-form permanent
        redir /blog/adding-methods-decorating-entity-metadata-wrapper /blog/decorating-entity-metadata-wrapper-add-refactor-methods permanent
        redir /blog/announcing-drupal-vm-generator /blog/announcing-the-drupal-vm-generator permanent
        redir /blog/announcing-the-drupal-vm-config-generator /blog/announcing-the-drupal-vm-generator permanent
        redir /blog/back-to-the-future-git-diff-apply /blog/back-future-gits-diff-apply-commands permanent
        redir /blog/building-gmail-filters-in-php /blog/building-gmail-filters-php permanent
        redir /blog/building-new-phpsw-website /blog/building-the-new-phpsw-website permanent
        redir /blog/building-presentation-slides-reveal-js-tailwind-css /blog/building-presentation-slides-rst2pdf permanent
        redir /blog/building-speaker-leaderboard-php-south-wales-using-drupal-symfony /blog/building-speaker-leaderboard-php-south-wales-drupal-symfony permanent
        redir /blog/create-and-apply-patches /blog/how-create-apply-patches permanent
        redir /blog/create-flickr-photo-gallery-using-feeds-cck-and-views /blog/create-flickr-photo-gallery-using-feeds-cck-views permanent
        redir /blog/creating-and-using-custom-tokens-drupal-7 /blog/creating-using-custom-tokens-drupal-7 permanent
        redir /blog/creating-custom-docksal-commands /blog/creating-custom-phpunit-command-docksal permanent
        redir /blog/debugging-drupal-commerce-promotions-illiminate-collections /blog/debugging-drupal-commerce-illuminate-collections permanent
        redir /blog/decorating-entity-metadata-wrapper-add-add-refactor-methods /blog/decorating-entity-metadata-wrapper-add-refactor-methods permanent
        redir /blog/dev-book-club-refactoring-chapter-1 /blog/dev-book-club-notes-refactoring-chapter-1 permanent
        redir /blog/dividing-drupals-process-preprocess-functions-separate-files /blog/dividing-drupals-process-and-preprocess-functions-separate-files permanent
        redir /blog/drupal-8-commerce-fixing-no-such-customer-error-(on-)?checkout /blog/drupal-8-commerce-fixing-no-such-customer-error-checkout permanent
        redir /blog/drupal-vm-generator-291-released /blog/drupal-vm-generator-updates permanent
        redir /blog/drupalcamp-london-2019-tickets /blog/drupalcamp-london-2019-tickets-available-call-sessions permanent
        redir /blog/drush-make-drupalbristol /talks/drush-make-drupalbristol permanent
        redir /blog/easier-git-repository-cloning-with-insteadof /blog/easier-git-repository-cloning-insteadof permanent
        redir /blog/easier-sculpin-commands-with-composer-and-npm-scripts /blog/easier-sculpin-commands-composer-npm-scripts permanent
        redir /blog/editing-meetup-videos-kdenlive /blog/editing-meetup-videos-linux-kdenlive permanent
        redir /blog/examples-of-laravel-collections-in-drupal /blog/using-laravel-collections-drupal permanent
        redir /blog/experimenting-with-events-in-drupal-8 /blog/experimenting-events-drupal-8 permanent
        redir /blog/fix-vagrant-loading-wrong-virtual-machine /blog/how-fix-vagrant-loading-wrong-virtual-machine permanent
        redir /blog/fixing-drupal-simpletest-docker /blog/fixing-drupal-simpletest-issues-inside-docker-containers permanent
        redir /blog/forward-one-domain-another-using-modrewrite-and-htaccess /blog/forward-one-domain-another-using-modrewrite-htaccess permanent
        redir /blog/forward-one-domain-another-using-modrewrite-and-htaccess /blog/forward-one-domain-another-using-modrewrite-htaccess permanent
        redir /blog/git-format-patch /blog/git-format-patch-your-friend permanent
        redir /blog/how-easily-embed-typekit-fonts-your-drupal-website /blog/easily-embed-typekit-fonts-your-drupal-website permanent
        redir /blog/how-split-new-drupal-contrib-project-within-another-repository /blog/splitting-new-drupal-project-from-repo permanent
        redir /blog/how-style-drupal-6s-taxonomy-lists-php-css-and-jquery /blog/style-drupal-6s-taxonomy-lists-php-css-jquery permanent
        redir /blog/include-local-drupal-settings-file-environment-configuration-overrides /blog/include-local-drupal-settings-file-environment-configuration-and-overrides permanent
        redir /blog/install-and-configure-subversion-svn-server-ubuntu /blog/how-install-configure-subversion-svn-server-ubuntu permanent
        redir /blog/live-blogging-symfonylive-london /blog/live-blogging-symfonylive-london-2019 permanent
        redir /blog/minimum-core-version /blog/how-define-minimum-drupal-core-version permanent
        redir /blog/nginx-redirects-with-query-string-arguments /blog/nginx-redirects-query-string-arguments permanent
        redir /blog/null-users-and-system-users-in-drupal /blog/null-users-system-users-drupal permanent
        redir /blog/overridding-phpcs-configuration-drupal-ci /blog/overriding-phpcs-configuration-drupal-ci permanent
        redir /blog/pantheon-settings-files /blog/include-environment-specific-settings-files-pantheon permanent
        redir /blog/pdfpc-pdf-presenter-console-notes /blog/presenting-pdf-slides-using-pdfpc-pdf-presenter-console permanent
        redir /blog/php-apps-subdirectory-nginx /blog/how-put-your-php-application-subdirectory-another-site-nginx permanent
        redir /blog/presenting-tailwind-css-ansible-cms-philly /blog/presenting-on-tailwind-css-and-ansible-at-cms-philly permanent
        redir /blog/programmatically-load-(an-)?entityform-(in-)?drupal-7 /blog/entityform permanent
        redir /blog/published-my-first-docker-images-docker-hub /blog/published-my-first-docker-images-docker-hub-adr-tools-sculpin-rst2pdf permanent
        redir /blog/publishing-sculpin-sites-(with-)?github-pages /blog/publishing-sculpin-sites-github-pages permanent
        redir /blog/queuing-private-messages-in-drupal-8 /blog/queuing-private-messages-drupal-8 permanent
        redir /blog/quick-project-switching-in-phpstorm /blog/quick-project-switching-phpstorm permanent
        redir /blog/quickly-apply-patches-using-git-and-curl-or-wget /blog/quickly-apply-patches-using-git-curl-or-wget permanent
        redir /blog/rebuilding-bartik-with-vuejs-tailwind-css-part-2 /blog/rebuilding-bartik-drupals-default-theme-vuejs-tailwind-css-part-2 permanent
        redir /blog/rebuilding-bartik-with-vuejs-tailwind-css /blog/rebuilding-bartik-drupals-default-theme-vuejs-tailwind-css permanent
        redir /blog/rebuilding-uis-tailwind-css /blog/uis-ive-rebuilt-tailwind-css permanent
        redir /blog/restructuring-my-tailwindjs-config-files /blog/restructuring-my-tailwindjs-configuration-files permanent
        redir /blog/retrieving-profile-data-user-using-entity-metadata-wrapper /blog/cleanly-retrieving-user-profile-data-using-entity-metadata-wrapper permanent
        redir /blog/running-drupal-with-symfony-local-server /blog/running-drupal-88-symfony-local-server permanent
        redir /blog/running-phpunit-tests-docksal-phpstorm /blog/how-run-drupal-8-phpunit-tests-within-docksal-phpstorm permanent
        redir /blog/simplifying-drupal-migrations-with-xautoload /blog/simplifying-drupal-migrations-xautoload permanent
        redir /blog/speaking-drupalcon-barcelona-2020 /blog/speaking-drupalcon-europe-2020 permanent
        redir /blog/speaking-during-lockdown /blog/speaking-remotely-during-covid-19 permanent
        redir /blog/speaking-remotely-during-lockdown /blog/speaking-remotely-during-covid-19 permanent
        redir /blog/style-drupal-6s-taxonomy-lists-php-css-jquery /blog/style-drupal-6s-taxonomy-lists-php-css-and-jquery permanent
        redir /blog/survey-results-my-drupalcon-europe-session /blog/survey-results-my-drupalcon-europe-session-test-driven-drupal permanent
        redir /blog/system-users-null-users /blog/null-users-and-system-users-in-drupal permanent
        redir /blog/test-driven-drupal-gitstore-leanpub /blog/test-driven-drupal-on-gitstore-leanpub permanent
        redir /blog/test-driven-drupal-presentation-drupalcon-europe-0 /blog/test-driven-drupal-presentation-drupalcon-europe permanent
        redir /blog/test-driven-drupal-session-drupalcon-europe /blog/test-driven-drupal-presentation-drupalcon-europe permanent
        redir /blog/test-driven-drupal-session-video-drupalcon-europe /blog/test-driven-drupal-presentation-drupalcon-europe permanent
        redir /blog/testing-tailwind-css-plugins-with-jest /blog/testing-tailwind-css-plugins-jest permanent
        redir /blog/testing-tailwindcss-plugins-with-jest /blog/testing-tailwind-css-plugins-jest permanent
        redir /blog/tweets-from-drupalcamp-london /blog/tweets-drupalcamp-london permanent
        redir /blog/updating-features-and-adding-components-using-drush /blog/updating-features-adding-components-using-drush permanent
        redir /blog/updating-forked-repositories-github /blog/updating-forked-github-repos permanent
        redir /blog/use-regular-expressions-search-and-replace-coda-or-textmate /blog/use-regular-expressions-search-replace-coda-or-textmate permanent
        redir /blog/using-environment-variables-settings-docksal /blog/how-use-environment-variables-your-drupal-settings-docksal permanent
        redir /blog/using-psr-4-autoloading-your-drupal-7-test-cases /blog/psr4-autoloading-test-cases-drupal-7 permanent
        redir /blog/using-tailwind-css-in-your-drupal-theme /blog/using-tailwind-css-your-drupal-theme permanent
        redir /blog/using-the-pcss-extension-postcss-webpack-encore /blog/using-pcss-extension-postcss-webpack-encore permanent
        redir /blog/weeknotes-june-5th /blog/weeknotes-2021-06-05 permanent
        redir /blog/writing-drupal-module-test-driven-development-tdd /blog/writing-new-drupal-8-module-using-test-driven-development-tdd permanent
        redir /book /test-driven-drupal permanent
        redir /calendars? https://savvycal.com/opdavies permanent
        redir /cms-philly /articles/presenting-on-tailwind-css-and-ansible-at-cms-philly permanent
        redir /code-enigma-interview https://blog.codeenigma.com/interview-with-a-drupal-expert-9fcd8e0fad28 permanent
        redir /consulting / permanent
        redir /contrib-half-hour https://www.youtube.com/playlist?list=PLu-MxhbnjI9rHroPvZO5LEUhr58Yl0j_F permanent
        redir /cv /cv.txt permanent
        redir /d0P5z /talks/drupal-8-php-libraries-drupalorg-api permanent
        redir /d7 /drupal7 permanent
        redir /dcbristol-cfp https://www.papercall.io/drupalcamp-bristol-2019 permanent
        redir /dcbristol17-videos https://www.youtube.com/playlist?list=PLOwPvExSyLLngtd6R4PUD9MCXa6QL_obA permanent
        redir /dcbristol19-announced /articles/drupalcamp-bristol-2019-speakers-sessions-announced permanent
        redir /dclondon-sat https://drupalcamp.london/schedule/saturday permanent
        redir /dclondon-sun https://drupalcamp.london/schedule/sunday permanent
        redir /dclondon20 /articles/drupalcamp-london-testing-workshop permanent
        redir /ddev-phpunit-command /blog/creating-custom-phpunit-command-ddev permanent
        redir /deploying-php-ansible /talks/deploying-php-ansible-ansistrano permanent
        redir /dks7E https://www.youtube.com/watch?v=PLS4ET7FAcU permanent
        redir /do-library https://github.com/opdavies/drupalorg-api-php permanent
        redir /do-projects https://github.com/opdavies/drupal-module-drupalorg-projects permanent
        redir /docksal-phpunit-phpstorm /articles/running-phpunit-tests-docksal-phpstorm permanent
        redir /docksal-posts /articles/tags/docksal permanent
        redir /dransible-drupal-9 /blog/upgrading-dransible-project-drupal-9 permanent
        redir /dransible https://github.com/opdavies/dransible permanent
        redir /drupal-bristol-march-19 https://docs.google.com/presentation/d/1pk9LIN-hHX73kvDdo-lzgmKlAeH33_K_uvI0t7A-rvY/edit?usp=sharing permanent
        redir /drupal-consultant /drupal-consulting permanent
        redir /drupal-consulting / permanent
        redir /drupal-core-live-stream https://www.youtube.com/watch?v=OK4FWwh1gQU permanent
        redir /drupal-core-testing-gate https://www.drupal.org/core/gates#testing permanent
        redir /drupal-first-time-issues https://www.drupal.org/project/issues/search?text=&projects=&assigned=&submitted=&project_issue_followers=&status%5B%5D=Open&issue_tags_op=%3D&issue_tags=Novice permanent
        redir /drupal-forum-post http://www.webmaster-forums.net/webmasters-corner/developing-my-website-using-php-and-mysql#comment-1231537 permanent
        redir /drupal-marketplace-uk https://www.drupal.org/drupal-services?offices%5B%5D=24460 permanent
        redir /drupal-meetups-twitterbot /articles/introducing-the-drupal-meetups-twitterbot permanent
        redir /drupal-novice-issues https://www.drupal.org/project/issues/search?text=&projects=&assigned=&submitted=&project_issue_followers=&status%5B%5D=Open&issue_tags_op=%3D&issue_tags=Novice permanent
        redir /drupal-php-developer-consultant-uk /drupal-php-developer permanent
        redir /drupal-php-developer /drupal-consultant permanent
        redir /drupal-tailwind-demo https://www.youtube.com/watch?v=1eM-Gw6GI4g permanent
        redir /drupal-tailwindcss https://www.drupal.org/project/tailwindcss permanent
        redir /drupal-vuejs /talks/decoupling-drupal-vuejs/ permanent
        redir /drupal7 /drupal-upgrade permanent
        redir /drupalcamp-london-2019-tickets /articles/drupalcamp-london-2019-tickets permanent
        redir /drupalcamp-nyc-training https://www.youtube.com/watch?v=3M9c4UUzKm0 permanent
        redir /drupalorg-project-issues https://www.drupal.org/project/issues/search?projects=Override+Node+Options%2C+Tailwind+CSS+Starter+Kit%2C+Block+ARIA+Landmark+Roles%2C+Copyright+Block+module%2C+System+User%2C+Null+User%2C+Collection+class%2C+Pathauto+Menu+Link%2C+Webform+ARIA&project_issue_followers=&status%5B%5D=1&status%5B%5D=13&status%5B%5D=8&status%5B%5D=14&status%5B%5D=15&issue_tags_op=%3D permanent
        redir /drupalorg https://www.drupal.org/u/opdavies permanent
        redir /drupalversary https://github.com/opdavies/drupal-module-drupalversary permanent
        redir /elewant https://elewant.com/shepherd/admire/opdavies permanent
        redir /feed /rss.xml permanent
        redir /first-drupal-core-issue https://www.drupal.org/project/drupal/issues/753898 permanent
        redir /first-npm-package https://www.npmjs.com/package/tailwindcss-vuejs permanent
        redir /freeagent https://opdavies.freeagent.com permanent
        redir /git-flow /talks/git-flow permanent
        redir /gitlab https://gitlab.com/opdavies permanent
        redir /gitstore https://enjoy.gitstore.app/maintainers/opdavies permanent
        redir /gmail-filters https://gitlab.com/opdavies/gmail-filters permanent
        redir /images/me-precedent.jpg /sites/default/files/images/social-avatar.jpg permanent
        redir /inviqa-tailwind-demo https://play.tailwindcss.com/Yfmw8O5UNN permanent
        redir /inviqa-tailwind-notes https://gist.github.com/opdavies/e6f0f4938506a6859acf1aca8b4e1a74 permanent
        redir /join-php-south-wales-slack https://join.slack.com/t/phpsouthwales/shared_invite/zt-4vuetc43-AvtEK1WqNzp5k1w4yWKOJA permanent
        redir /jy6rW https://www.meetup.com/PHP-South-Wales/events/264731393 permanent
        redir /kB6Jd /articles/running-drupal-with-symfony-local-server/ permanent
        redir /kmDRA https://www.bbc.co.uk/news/uk-46561779 permanent
        redir /leeds-php-drupal-9 https://www.meetup.com/leedsphp/events/272504993 permanent
        redir /live https://www.youtube.com/channel/UCkeK0qF9HHUPQH_fvn4ghqQ permanent
        redir /npm https://www.npmjs.com/~opdavies permanent
        redir /oFlkS /articles/test-driven-drupal-on-gitstore-leanpub permanent
        redir /oliver-davies-uk-based-drupal-symfony-developer /oliver-davies-uk-based-drupal-php-developer permanent
        redir /pair-programming /pair permanent
        redir /pair-with-me /pair permanent
        redir /pairing /pair permanent
        redir /php-ansible /talks/deploying-php-ansible-ansistrano permanent
        redir /presentations/building-static-websites-sculpin /presentations/sculpin permanent
        redir /qSHAl /articles/published-my-first-npm-package/ permanent
        redir /qT1Rb https://github.com/opdavies/drupal-meetups-twitterbot permanent
        redir /rebuilding-acquia https://rebuilding-acquia.oliverdavies.uk permanent
        redir /rebuilding-bartik /articles/rebuilding-bartik-with-vuejs-tailwind-css permanent
        redir /rebuilding-bristol-js https://github.com/opdavies/rebuilding-bristol-js permanent
        redir /rebuilding-pantheon https://play.tailwindcss.com/LND98XihGI?layout=horizontal permanent
        redir /rebuilding-platformsh https://rebuilding-platformsh.oliverdavies.uk permanent
        redir /rebuilding-symfony https://github.com/opdavies/rebuilding-symfony permanent
        redir /rk29B https://www.meetup.com/PHP-South-Wales/events/268422525 permanent
        redir /roadmap /drupal-upgrade permanent
        redir /rss /rss.xml permanent
        redir /rst2pdf /talks/building-presenting-slide-decks-rst2pdf permanent
        redir /s9MjJ https://symfonycasts.com/screencast/symfony permanent
        redir /sculpin-encore-versioning https://github.com/opdavies/oliverdavies.uk/commit/d192b04aefa6e7a21bfc1f2e0fe0a16111e0e8a2 permanent
        redir /sculpin /talks/building-static-websites-sculpin permanent
        redir /sites/default/files/images/social-avatar.jpg /images/social-avatar.jpg permanent
        redir /skills https://opdavies-skills-tailwindcss.netlify.com/ permanent
        redir /slides-drupal-9 https://slides-upgrading-to-drupal-9.oliverdavies.uk permanent
        redir /slides-upgrading-to-drupal-9 https://slides-upgrading-to-drupal-9.oliverdavies.uk permanent
        redir /slides-upgrading-to-drupal-9/index.html https://slides-upgrading-to-drupal-9.oliverdavies.uk permanent
        redir /slides-working-with-workspace https://slides-working-with-workspace.oliverdavies.uk permanent
        redir /speaker-info /speaker permanent
        redir /speaker-information /speaker permanent
        redir /speaker /press permanent
        redir /speaking-videos https://www.youtube.com/playlist?list=PLHn41Ay7w7kfAzczswrANch5oHAPZBlvu permanent
        redir /stream https://www.youtube.com/channel/UCkeK0qF9HHUPQH_fvn4ghqQ/live permanent
        redir /subscription / permanent
        redir /swap-markdown-parser https://github.com/opdavies/sculpin-twig-markdown-bundle-example/tree/swap-markdown-parser permanent
        redir /symfony-server /articles/running-drupal-with-symfony-local-server permanent
        redir /symfony https://connect.symfony.com/profile/opdavies permanent
        redir /symfonylive /articles/live-blogging-symfonylive-london permanent
        redir /symposium https://symposiumapp.com/u/opdavies permanent
        redir /tailwind-css-talk /talks/taking-flight-tailwind-css permanent
        redir /tailwind-repos https://github.com/opdavies?utf8=%e2%9c%93&tab=repositories&q=tailwindcss permanent
        redir /tailwind-talk /talks/taking-flight-with-tailwind-css permanent
        redir /tailwindcss-demo http://tailwindcss-demo.oliverdavies.uk/ permanent
        redir /talks /presentations permanent
        redir /talks-offer-tweet https://twitter.com/opdavies/status/1250870367712935938 permanent
        redir /talks/2012/09/05/what-is-this-drupal-thing-unified-diff /talks/what-is-this-drupal-thing permanent
        redir /talks/2013/07/10/drupal-ldap-swdug /talks/drupal-ldap permanent
        redir /talks/2014/03/01/git-flow-drupalcamp-london-2014 /talks/git-flow permanent
        redir /talks/2014/07/02/drush-make-drupalbristol-drupal-bristol /talks/drush-make-drupalbristol permanent
        redir /talks/2014/08/19/drupal-association-swdug /talks/drupal-association permanent
        redir /talks/2015/01/18/drupalorg-2015-drupalcamp-brighton-2015 /talks/drupalorg-in-2015-whats-coming-next permanent
        redir /talks/2015/02/28/drupalorg-2015-drupalcamp-london-2015 /talks/drupalorg-in-2015-whats-coming-next permanent
        redir /talks/2015/04/08/drupal-8-phpsw /talks/drupal-8 permanent
        redir /talks/2015/07/25/test-drive-twig-with-sculpin-drupalcamp-north-2015 /talks/test-drive-twig-with-sculpin permanent
        redir /talks/2015/08/25/dancing-for-drupal-umbristol /talks/dancing-for-drupal permanent
        redir /talks/2015/10/14/sculpin-phpsw /talks/sculpin permanent
        redir /talks/2016/03/05/drupal-8-module-development-drupalcamp-london-2016 /talks/getting-started-with-drupal-8-module-development permanent
        redir /talks/2016/03/09/drupal-vm-generator-nwdug /talks/drupal-vm-generator permanent
        redir /talks/2016/04/02/drupal-vm-generator-drupal-bristol /talks/drupal-vm-generator permanent
        redir /talks/2016/06/11/drupal-8-rejoining-the-herd-php-south-coast-2016 /talks/drupal-8-rejoining-the-herd permanent
        redir /talks/2016/07/23/drupal-vm-meet-symfony-console-drupalcamp-bristol-2016 /talks/drupal-vm-meet-symfony-console permanent
        redir /talks/2016/11/09/drupal-development-with-composer-phpsw /talks/drupal-development-with-composer permanent
        redir /talks/2016/11/17/goodbye-drush-make-hello-composer-drupal-bristol /talks/goodbye-drush-make-hello-composer permanent
        redir /talks/2017/01/18/getting-your-data-into-drupal-8-drupal-bristol /talks/getting-your-data-into-drupal-8 permanent
        redir /talks/2017/03/04/getting-your-data-into-drupal-8-drupalcamp-london-2017 /talks/getting-your-data-into-drupal-8 permanent
        redir /talks/ansible-ansistrano https://www.oliverdavies.uk/talks/deploying-php-ansible-ansistrano permanent
        redir /talks/deploying-php-applications-fabric /talks/deploying-php-fabric permanent
        redir /talks/deploying-php-applications-with-fabric /talks/deploying-php-fabric permanent
        redir /talks/drupal-vm-generator-2 /talks/drupal-vm-generator permanent
        redir /talks/drupalorg-2015-2 /talks/drupalorg-2015 permanent
        redir /talks/drupalorg-in-2015-whats-coming-next /talks/drupalorg-2015 permanent
        redir /talks/getting-started-with-drupal-8-module-development /drupal-8-module-development permanent
        redir /talks/having-fun-drupal-8-php-libraries-drupalorg-api /talks/drupal-8-php-libraries-drupalorg-api permanent
        redir /talks/never-commit-master-introduction-git-flow /talks/git-flow permanent
        redir /talks/sculpin /talks/building-static-websites-sculpin permanent
        redir /talks/tailwind /talks/taking-flight-with-tailwind-css/ permanent
        redir /talks/taking-flight-tailwind-css /talks/taking-flight-with-tailwind-css permanent
        redir /talks/using-laravel-collections-outside-laravel /talks/using-illuminate-collections-outside-laravel permanent
        redir /talks/working-workspace /talks/working-with-workspace permanent
        redir /tdd-blog https://github.com/opdavies/drupal-module-tdd-blog permanent
        redir /tdd-test-driven-drupal /talks/tdd-test-driven-drupal/ permanent
        redir /team-coaching / permanent
        redir /test-driven-drupal-book /test-driven-drupal permanent
        redir /testing-drupal-intro https://inviqa.com/blog/drupal-automated-testing-introduction permanent
        redir /testing-drupal https://www.oliverdavies.uk/talks/tdd-test-driven-drupal permanent
        redir /testing-tailwind-plugins /articles/testing-tailwindcss-plugins-with-jest permanent
        redir /testing-workshop-code https://github.com/opdavies/workshop-drupal-automated-testing-code permanent
        redir /testing-workshop https://github.com/opdavies/workshop-drupal-automated-testing permanent
        redir /todoist-filters https://gist.github.com/opdavies/6709fbdac5c3babbd94137bcc8b8e3c2 permanent
        redir /twitter-tweaks https://github.com/opdavies/chrome-extension-twitter-tweaks permanent
        redir /upgrading-to-drupal-9 /talks/upgrading-your-site-drupal-9 permanent
        redir /uxbjV https://www.drupal.org/project/copyright_block permanent
        redir /vyTEF https://www.npmjs.com/package/tailwindcss-vuejs permanent
        redir /webpack-encore-pcss-regex https://regexr.com/51iaf permanent
        redir /wordcamp-bristol-tailwindcss https://2019.bristol.wordcamp.org/session/taking-flight-with-tailwind-css permanent
        redir /wordpress-tailwind https://github.com/opdavies/wordcamp-bristol-2019 permanent
        redir /work /drupal-php-developer permanent
        redir /working-with-workspace /talks/working-with-workspace permanent
        redir /workshop-drupal-testing https://github.com/opdavies/workshop-drupal-automated-testing permanent
        redir /workspace-demo https://github.com/opdavies/working-with-workspace-demo permanent
        redir /wp-tailwind-repo https://github.com/opdavies/wordcamp-bristol-2019 permanent
        redir /wp-tailwind-starter https://github.com/opdavies/wordpress-tailwindcss-startker-kit permanent
        redir /wp-tailwind-static https://wp-tailwind.oliverdavies.uk permanent
        redir /wp-tailwind https://wp-tailwind.oliverdavies.uk permanent
        redir /yXhoS /talks/things-you-should-know-about-php permanent
      '';
    };
  };
}
