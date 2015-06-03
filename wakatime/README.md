# Wakatime contribution layer for Spacemacs

![logo_wakatime](img/wakatime.png) 

## Description

This layer adds support for Wakatime.

WakaTime was built to solve time tracking for programmers.

Since we work inside a text editor, why should we have to start and stop a timer? WakaTime uses open-source text editor plugins to automatically track the time you spend programming so you never have to manually track it again!

P.S. wakati means time in Swahili

## Install

### Layer

To use this contribution add it to your `~/.spacemacs`

```elisp
(setq-default dotspacemacs-configuration-layers '(wakatime))
```

## Wakatime Program

You can follow wakatime installation instructions here
https://github.com/wakatime/wakatime-mode.
But in short it's just:
```sh
pip install wakatime
```
For some linux users
```sh
sudo pip install wakatime
```

## API Keys


https://wakatime.com/settings/account?apikey=true
