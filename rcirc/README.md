# Python contribution layer for Spacemacs

## Install

To use this contribution add it to your `~/.spacemacs`

```elisp
(setq-default dotspacemacs-configuration-layers '(rcirc))
```

## Key Bindings

Send code to inferior process commands:

    Key Binding       |                 Description
----------------------|------------------------------------------------------------
<kbd>SPC a i</kbd>    | Open rcirc
<kbd>SPC P o i</kbd>  | Open rcirc in a perspective (if perspectives layer is enabled)

## Setting up

This method has three ways of connecting

### The old boring way
You can overwrite the default server list

```elisp
      (setq rcirc-server-alist
            '(("irc.freenode.net"
               :user "spacemacs_user"
               :port "1337"
               :password "le_passwd"
               :channels ("#emacs"))))
```

### The ~/.authinfo.gpg way

#### The normal way

You have to have sth similar to this in your ~/.authinfo.gpg
```
machine irc.freenode.net port nickserv user spacemacs_user password le_passwd
```

and then setup your server
```elisp
      (setq rcirc-server-alist
            '(("irc.freenode.net"
               :user "spacemacs_user"
               :port "1337"
               :channels ("#emacs"))))
```
