function fish_right_prompt --description "Hydro right prompt"
    test "$hydro_rightprompt" = true || return
    test "$hydro_multiline" = true && return
    echo -e -n "$_hydro_status_code$hydro_color_normal$_hydro_color_duration$_hydro_cmd_duration$hydro_color_normal$_hydro_color_git$$_hydro_git$hydro_color_normal"
end
