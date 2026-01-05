function fish_prompt --description Hydro
    if test "$hydro_rightprompt" = true
        if test "$hydro_multiline" = true
            set -l left_prompt "$_hydro_color_start$hydro_symbol_start$hydro_color_normal$_hydro_color_pwd$_hydro_pwd$hydro_color_normal"
            set -l right_prompt "$_hydro_status_code$hydro_color_normal$_hydro_color_duration$_hydro_cmd_duration$hydro_color_normal$_hydro_color_git$$_hydro_git$hydro_color_normal"

            set -l left_len (string length -V "$_hydro_pwd")
            set -l right_prompt_plain (string replace -ra '\e\[[0-9;]*m' '' "$right_prompt")
            set -l right_len (string length -V "$right_prompt_plain")

            math max 0, $COLUMNS - $left_len - $right_len - 1 | read -l padding
            set -l spaces (string repeat -n $padding ' ')

            echo -e -n -s $left_prompt $spaces $right_prompt"$_hydro_status$hydro_color_normal "
        else
            echo -e -n "$_hydro_color_start$hydro_symbol_start$hydro_color_normal$_hydro_color_pwd$_hydro_pwd$hydro_color_normal $_hydro_status$hydro_color_normal "
        end
    else
        echo -e -n "$_hydro_color_start$hydro_symbol_start$hydro_color_normal$_hydro_color_pwd$_hydro_pwd$hydro_color_normal $_hydro_color_git$$_hydro_git$hydro_color_normal$_hydro_color_duration$_hydro_cmd_duration$hydro_color_normal$_hydro_status$hydro_color_normal "
    end
end
