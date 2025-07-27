{
  flake.modules.nixos.pc.services.kanata.keyboards.default.config = ''
    (defsrc
      caps a s d f j k l ;
    )

    (defvar
      tap-time 150
      hold-time 200
      hold-time-slow 300
    )

    (defalias
      escctrl (tap-hold 100 100 esc lctl)
      a (tap-hold $tap-time $hold-time-slow a lmet)
      s (tap-hold $tap-time $hold-time-slow s lalt)
      d (tap-hold $tap-time $hold-time d lsft)
      f (tap-hold $tap-time $hold-time f lctl)
      j (tap-hold $tap-time $hold-time j rctl)
      k (tap-hold $tap-time $hold-time k rsft)
      l (tap-hold $tap-time $hold-time-slow l ralt)
      ; (tap-hold $tap-time $hold-time-slow ; rmet)
    )

    (deflayer base
      @escctrl @a @s @d @f @j @k @l @;
    )
  '';
}
