{ ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_vi_key_bindings
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
