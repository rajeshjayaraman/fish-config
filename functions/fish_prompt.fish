function fish_prompt --description 'Write out the prompt'
	
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_prompt_eggplant
        set -g __fish_prompt_eggplant (set_color 62A)
    end

    if not set -q __fish_prompt_lightred
        set -g __fish_prompt_lightred (set_color A33)
    end

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    switch "$USER"

        case root toor

            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'

            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            printf '%s[%s] %s%s@%s %s%s %s(%s)%s \f\r> ' "$__fish_prompt_lightred" (date "+%Y-%m-%d %H:%M:%S") "$__fish_prompt_eggplant" $USER (prompt_hostname) "$__fish_prompt_cwd" "$PWD" "$__fish_color_status" "$stat" "$__fish_prompt_normal"

    end
end
