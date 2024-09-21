{ ... }: {
  programs.fish = {
    enable = true;
    functions = {
      fish_user_key_bindings = ''
        # Execute this once per mode that emacs bindings should be used in
        fish_default_key_bindings -M insert

        # Then execute the vi-bindings so they take precedence when there's a conflict.
        # Without --no-erase fish_vi_key_bindings will default to
        # resetting all bindings.
        # The argument specifies the initial mode (insert, "default" or visual).
        fish_vi_key_bindings --no-erase insert
      '';
    };
    interactiveShellInit = ''
      set fish_greeting
      fish_user_key_bindings
      set fish_vi_force_cursor 1
      function fish_mode_prompt; end
      set fish_cursor_default block
      set fish_cursor_insert line
      set fish_cursor_replace_one underscore
      set fish_cursor_replace underscore
      function v
        if [ -n "$VIM_TERMINAL" ]
          set filename (realpath $argv[1] | string collect; or echo)
          echo -e '\\e]51;["drop", "'"$filename"'"]\\07'
        else
          vim $argv[1]
        end
      end
    '';
  };
}
