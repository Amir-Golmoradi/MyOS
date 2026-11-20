function __prompt_git_branch
    command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    or return

    set -l branch (command git symbolic-ref --short HEAD 2>/dev/null)

    if test -z "$branch"
        set branch (command git rev-parse --short HEAD 2>/dev/null)
    end

    set -l dirty ""

    if not command git diff --quiet --ignore-submodules -- 2>/dev/null
        set dirty " *"
    else if not command git diff --cached --quiet --ignore-submodules -- 2>/dev/null
        set dirty " *"
    end

    echo "$branch$dirty"
end

function __prompt_hostname
    set -l name (uname -n 2>/dev/null)

    if test -z "$name"
        echo my-pc
    else
        string split "." $name | head -n 1
    end
end

function __prompt_loads
    switch (uname)
        case Darwin
            set -l loads (sysctl -n vm.loadavg 2>/dev/null)
            set loads (string replace -a "{" "" $loads)
            set loads (string replace -a "}" "" $loads)
            echo $loads[1] $loads[2] $loads[3]

        case Linux
            set -l loads (cat /proc/loadavg 2>/dev/null)
            echo $loads[1] $loads[2] $loads[3]

        case '*'
            echo "0.00 0.00 0.00"
    end
end

function __prompt_uptime_short
    switch (uname)
        case Darwin
            set -l up_line (uptime)

            set -l up_part (string replace -r '^.*up +' '' $up_line)
            set up_part (string replace -r ', +[0-9]+ users?.*$' '' $up_part)
            set up_part (string replace -r ', +load averages?:.*$' '' $up_part)

            echo $up_part

        case Linux
            set -l up_part (uptime -p 2>/dev/null)
            set up_part (string replace "up " "" $up_part)
            echo $up_part

        case '*'
            echo "0:00"
    end
end

function fish_prompt
    set -l black 242424
    set -l red c90012
    set -l white ffffff
    set -l gray 555555

    set -l sep_right ""
    set -l branch_icon ""

    # First line
    set_color --bold brblack
    echo (uname -s)' '(__prompt_hostname)' '(uname -r)' '(uname -m)

    # Second line
    set -l time_now (date "+%H:%M")
    set -l users_count (who | wc -l | string trim)
    set -l up_part (__prompt_uptime_short)
    set -l loads (__prompt_loads)

    set_color --bold brblack
    echo "$time_now  up  $up_part, $users_count users, load averages: $loads"

    # Directory segment
    set_color $white --background=$black --bold
    printf ' %s ' (prompt_pwd)

    # Black to red separator
    set_color $black --background=$red
    printf '%s' $sep_right

    # Git branch segment
    set -l git_branch (__prompt_git_branch)

    set_color $white --background=$red --bold

    if test -n "$git_branch"
        printf ' %s %s ' $branch_icon $git_branch
    else
        printf ' '
    end

    # Prompt symbol
    if fish_is_root_user
        printf '#'
    else
        printf '$'
    end

    # End red segment
    set_color $red --background=normal
    printf '%s' $sep_right

    set_color normal
    printf ' '
end
