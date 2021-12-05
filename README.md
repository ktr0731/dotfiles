Dotfiles
====

```

     _             ___ _ _
    | |      _    / __|_) |
  _ | | ___ | |_ | |__ _| | ____  ___
 / || |/ _ \|  _)|  __) | |/ _  )/___)
( (_| | |_| | |__| |  | | ( (/ /|___ |
 \____|\___/ \___)_|  |_|_|\____|___/

```

## Installation

``` sh
$ curl -sL --create-dirs -o ~/.config/chezmoi/chezmoi.toml 'https://raw.githubusercontent.com/ktr0731/dotfiles/master/dot_config/chezmoi/chezmoi.toml'
$ sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply ktr0731
```
