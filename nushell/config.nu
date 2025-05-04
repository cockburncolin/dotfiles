source ./starship.nu
source ./zoxide.nu

## Env settings
$env.config.buffer_editor = "nvim"
$env.EDITOR = "nvim"
$env.config.show_banner = false

## Aliases
alias cd = z
alias ci = zi
alias vim = nvim

