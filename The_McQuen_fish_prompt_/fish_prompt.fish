function __mcquen_decorate
    echo -n " ⟡ "

    if [ (count $argv) -gt 1 ]
        set_color $argv[2..(count $argv)]
    end

    echo -n $argv[1]
    set_color $fish_color_normal
end

function __mcquen_prompt_date
    __mcquen_decorate (date +%H:%M:%S) "cc0"
end

function __mcquen_prompt_hostname
    set -l whoami (whoami)
    if [ (whoami) = 'root' ]
        __mcquen_decorate $whoami "red" "--underline"
    else
        __mcquen_decorate $whoami "cyan"
    end
end

function __mcquen_prompt_git
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_char_stateseparator " "

    set -l prompt (__fish_git_prompt "%s")

    if [ -n "$prompt" ]
        __mcquen_decorate $prompt
    end
end

function __mcquen_prompt_cwd
    __mcquen_decorate (prompt_pwd) yellow
end

function __mcquen_prompt_fish
    # __mcquen_decorate '🐠 ><(((°> 🐟 ' blue
    __mcquen_decorate '🐠 🐟 🐡' blue
end

function fish_prompt
    echo -n "┌"
    set -g fish_prompt_pwd_dir_length 0

    __mcquen_prompt_cwd
    __mcquen_prompt_git
    # __mcquen_prompt_hostname
    __mcquen_prompt_date
    __mcquen_prompt_fish

    echo "\n└─λ "
end
