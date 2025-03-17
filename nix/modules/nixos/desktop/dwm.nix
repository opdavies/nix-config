{
  config,
  lib,
  pkgs,
  self,
  ...
}:

with lib;

{
  options.nixosModules.dwm.enable = mkEnableOption "Enable dwm";

  config = mkIf config.nixosModules.dwm.enable {
    services = {
      dwm-status = {
        enable = true;

        order = [
          "audio"
          "battery"
          "network"
          "time"
        ];
      };

      xserver = {
        displayManager.startx.enable = true;

        windowManager.dwm = {
          enable = true;

          package = pkgs.dwm.override {
            conf = ''
              static const unsigned int borderpx  = 1;
              static const unsigned int snap = 32;
              static const int showbar = 1;
              static const int topbar = 1;
              static const char *fonts[] = { "monospace:size=10" };
              static const char dmenufont[] = "monospace:size=10";
              static const char col_gray1[] = "#222222";
              static const char col_gray2[] = "#444444";
              static const char col_gray3[] = "#bbbbbb";
              static const char col_gray4[] = "#eeeeee";
              static const char col_cyan[]  = "#005577";
              static const char *colors[][3] = {
                [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
                [SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
              };

              static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

              static const Rule rules[] = {
                { "Gimp", NULL, NULL, 0, 1, -1 }, 
                { "Firefox", NULL, NULL, 1 << 8, 0, -1 }, 
              };

              static const float mfact = 0.55;
              static const int nmaster = 1;
              static const int resizehints = 1;
              static const int lockfullscreen = 1;

              static const Layout layouts[] = {
                { "[]=", tile },
                { "><>", NULL },
                { "[M]", monocle },
              };

              #define MODKEY Mod4Mask

              #define TAGKEYS(KEY,TAG) \
                { MODKEY, KEY, view, {.ui = 1 << TAG} }, \
                { MODKEY|ControlMask, KEY, toggleview, {.ui = 1 << TAG} }, \
                { MODKEY|ShiftMask, KEY, tag, {.ui = 1 << TAG} }, \
                { MODKEY|ControlMask|ShiftMask, KEY, toggletag, {.ui = 1 << TAG} }, 

              #define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

              static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
              static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
              static const char *termcmd[] = { "st", NULL };

              static const Key keys[] = {
                { MODKEY, XK_p, spawn, {.v = dmenucmd } },
                { MODKEY|ShiftMask, XK_Return, spawn, {.v = termcmd } },
                { MODKEY, XK_b, togglebar, {0} },
                { MODKEY, XK_j, focusstack, {.i = +1 } },
                { MODKEY, XK_k, focusstack, {.i = -1 } },
                { MODKEY, XK_i, incnmaster, {.i = +1 } },
                { MODKEY, XK_d, incnmaster, {.i = -1 } },
                { MODKEY, XK_h, setmfact, {.f = -0.05} },
                { MODKEY, XK_l, setmfact, {.f = +0.05} },
                { MODKEY, XK_Return, zoom, {0} },
                { MODKEY, XK_Tab, view, {0} },
                { MODKEY|ShiftMask, XK_c, killclient, {0} },
                { MODKEY, XK_t, setlayout, {.v = &layouts[0]} },
                { MODKEY, XK_f, setlayout, {.v = &layouts[1]} },
                { MODKEY, XK_m, setlayout, {.v = &layouts[2]} },
                { MODKEY, XK_space, setlayout, {0} },
                { MODKEY|ShiftMask, XK_space, togglefloating, {0} },
                { MODKEY, XK_0, view, {.ui = ~0 } },
                { MODKEY|ShiftMask, XK_0, tag, {.ui = ~0 } },
                { MODKEY, XK_comma, focusmon, {.i = -1 } },
                { MODKEY, XK_period, focusmon, {.i = +1 } },
                { MODKEY|ShiftMask, XK_comma, tagmon, {.i = -1 } },
                { MODKEY|ShiftMask, XK_period, tagmon, {.i = +1 } },
                TAGKEYS(XK_1, 0)
                TAGKEYS(XK_2, 1)
                TAGKEYS(XK_3, 2)
                TAGKEYS(XK_4, 3)
                TAGKEYS(XK_5, 4)
                TAGKEYS(XK_6, 5)
                TAGKEYS(XK_7, 6)
                TAGKEYS(XK_8, 7)
                TAGKEYS(XK_9, 8)
                { MODKEY|ShiftMask, XK_b, spawn, SHCMD("${lib.getExe pkgs.brave}") },
                { MODKEY|ShiftMask, XK_f, spawn, SHCMD("${pkgs.xfce.thunar}/bin/thunar") },
                { MODKEY|ShiftMask, XK_i, spawn, SHCMD("${pkgs.xdotool}/bin/xdotool type $(cat ~/snippets.txt | grep -v '^#' | grep -v '^$' | sort | dmenu -i -l 50 | cut -d' ' -f1)") },
                { MODKEY|ShiftMask, XK_p, spawn, {.v = (const char*[]){ "${pkgs.pass}/bin/passmenu", "-i", NULL} } },
                { MODKEY|ShiftMask, XK_q, quit, {0} },
                { MODKEY|ShiftMask, XK_r, quit, {1} },
                { MODKEY|ShiftMask, XK_s, spawn, SHCMD("${pkgs.flameshot}/bin/flameshot gui") },
                { MODKEY|ShiftMask, XK_y, spawn, SHCMD("${pkgs.copyq}/bin/copyq toggle") },
                { MODKEY, XK_F3, spawn, {.v = (const char*[]){ "${getExe pkgs.displayselect}", NULL} } },
                { MODKEY, XK_F9, spawn, {.v = (const char*[]){ "/home/opdavies/bin/mounter", NULL } } },
                { MODKEY, XK_F10, spawn, {.v = (const char*[]){ "/home/opdavies/bin/unmounter", NULL } } },
              };

              static const Button buttons[] = {
                { ClkLtSymbol, 0, Button1, setlayout, {0} },
                { ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]} },
                { ClkWinTitle, 0, Button2, zoom, {0} },
                { ClkStatusText, 0, Button2, spawn, {.v = termcmd } },
                { ClkClientWin, MODKEY, Button1, movemouse, {0} },
                { ClkClientWin, MODKEY, Button2, togglefloating, {0} },
                { ClkClientWin, MODKEY, Button3, resizemouse, {0} },
                { ClkTagBar, 0, Button1, view, {0} },
                { ClkTagBar, 0, Button3, toggleview, {0} },
                { ClkTagBar, MODKEY, Button1, tag, {0} },
                { ClkTagBar, MODKEY, Button3, toggletag, {0} },
              };
            '';

            patches = with pkgs; [
              "${self}/patches/dwm/restartsig.patch"

              (fetchpatch {
                url = "https://dwm.suckless.org/patches/preserveonrestart/dwm-preserveonrestart-6.3.diff";
                sha256 = "zgwTCgD3YE+2K4BF6Em+qkM1Gax5vOZfeuWa6zXx8cE=";
              })

              (fetchpatch {
                url = "https://dwm.suckless.org/patches/hide_vacant_tags/dwm-hide_vacant_tags-6.4.diff";
                sha256 = "GIbRW0Inwbp99rsKLfIDGvPwZ3pqihROMBp5vFlHx5Q=";
              })

              (fetchpatch {
                url = "https://dwm.suckless.org/patches/pertag/dwm-pertag-20200914-61bb8b2.diff";
                sha256 = "wRZP/27V7xYOBnFAGxqeJFXdoDk4K1EQMA3bEoAXr/0=";
              })
            ];
          };
        };
      };
    };

    systemd.user.services.dwm-status.serviceConfig.Restart = "on-failure";

    environment.systemPackages = with pkgs; [
      dmenu
      dmenu-bluetooth
      networkmanager_dmenu
      slock
      xdotool
    ];
  };
}
