local ret_status="%(?::%{$fg_bold[red]%}*)"

# colors
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'
eval my_blue='$FG[032]'
eval my_light_blue='$FG[075]'
eval my_green='$FG[078]'
eval my_purple='$FG[105]'

PROMPT='${ret_status}\
$my_blue%c\
$(git_prompt_info) \
$my_purple%(!.#.»)%{$reset_color%} '

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$my_light_blue($my_green"
ZSH_THEME_GIT_PROMPT_SUFFIX="$my_light_blue)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"

