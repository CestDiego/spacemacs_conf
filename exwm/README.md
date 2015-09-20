# EXWM User Guide
<!-- ...................................................................... -->
This guide serves as an introduction for new users to EXWM as well as a
reference for advanced users.
It mainly discusses major conceptions, usage and configurations of EXWM.
It will be updated accordingly as EXWM evolves.
Please consider helping improve this document.

## Prerequisites
<!-- ...................................................................... -->
There's no specific prerequisite indeed.
But if there have to be some, here they are (should be easily satisfied):
* GNU Emacs with version higher than 24.4, 25 preferred.
  Also GTK+3 and 64-bit build is preferred.
  You should probably hide menu-bar, tool-bar, scroll-bar etc to work in EXWM
  or it would be quite wired.
* X11 server (a recent version please).
* (Optional) `ido-mode`.

## Installation
<!-- ...................................................................... -->
You should first checkout the code of [XELB](https://github.com/ch11ng/xelb)
and EXWM, then add their source directories to `load-path` like:

```
(add-to-list 'load-path "/path/to/xelb/")
(add-to-list 'load-path "/path/to/exwm/")
```

## Bootstrap
<!-- ...................................................................... -->
For those impatient: you might start trying EXWM by copying the
[example configuration](https://github.com/ch11ng/exwm/wiki/Configuration-Example).
You should revisit this document later to tweak EXWM if you decide to use it.

P.S. New users often wonder how to properly launch an application in EXWM.
The answer is it doesn't matter because EXWM is a serious X window manager and
knows how to do it correctly.
*Do not* launch applications with <kbd>M-!</kbd> (`shell-command`) though
as it will block Emacs and therefore freeze EXWM.
The example configuration provides <kbd>s-&</kbd> to do this conveniently.

## Conventions
<!-- ...................................................................... -->
This section discusses some conventions which you should make clear before
going through the rest of this document.

**Note**: All configuration code should be put in your `.emacs`
(rather than evaluated after EXWM has finished starting)
unless otherwise specified.
Also don't forget to put `(exwm-enable)` there to actually enable EXWM.

An *X window* in this document exclusively refers to a top-level X window
created by an application.
An application may create multiple such X windows;
EXWM just manages them respectively.
That is, what EXWM sees are merely top-level X windows;
it does not care about which application creates them.

`exwm-mode` is a major mode provided by EXWM to manage X windows.
A buffer created in `exwm-mode` records all information about the corresponding
X window.
`exwm-mode` also provides useful features to interact with that X window.
Things dedicated to an `exwm-mode` buffer are said to be *local*;
otherwise, they are *global*.

An `exwm-mode` buffer has two *input modes*: `line-mode` and `char-mode`
(these phrases are borrowed from `ansi-mdoe`).
They define how key events should be processed.
In `line-mode`, EXWM intercepts all key events and makes nearly all Emacs key
bindings available to you except those you explicitly assigned to EXWM.
Whereas in `char-mode`, EXWM does no interception but only responds to those
globally grabbed key sequences.
`exwm-mode` buffers are created in `line-mode` by default.
We will discuss how to switch input mode later.

As a tiling X window manger, EXWM manages X windows in a *tiling* layout by
default.
However, if an X window explicitly requires it, EXWM can alternatively manage
it in a *floating* (or *stacking*) layout.
There are several ways for a user to switch the layout of an X window, as will
be discussed later in this document.

## Keybindings
<!-- ...................................................................... -->
EXWM is a keyboard-driven X window manager, thus it's of great importance to
understand *key event* representations and learn how to specify/modify
*key bindings*.
Fortunately, EXWM uses the same syntax as Emacs itself to denote key events, so
you should feel it quite comfortable to configure it.
Besides, it's rather simple to find the representation of a key event by
evaluating `(read-key)` or `(read-event)` when you are not sure.

As with Emacs, EXWM uses a *key sequence* (or *key* for short)
rather than a single key event to make a key binding.
Indeed, key sequences in EXWM are registered to either global or local
*keymaps* just like what is normally done in Emacs;
what EXWM does is to forward those key sequences to Emacs if they are
originally intended for other X windows.

One thing worth mentioning is the <kbd>s-</kbd> (<kbd>Super</kbd>) modifier
key.
Key sequences consisting of this modifier key (or at least some of them)
are usually unusable to Emacs if you are working in other X window managers.
However, in EXWM you have full access to any key sequence
(though there might still be some rare exceptions like
<kbd>Ctrl</kbd> <kbd>Alt</kbd> <kbd>F1</kbd>).
The <kbd>s-</kbd> modifier key will be frequently used in this document.

### Global key bindings
<!-- ...................................................................... -->
Global key bindings are available in both `line-mode` and `char-mode`.
They even work in normal buffers; take this into account when you make a global
key binding.

There is no global key bindings predefined in EXWM by default,
but you can easily make one with `exwm-input-set-key` which works precisely
like `global-set-key`.
Key bindings in the following table are recommended but again, *not* bound by
default.

| Key            | Command                     | Remark |
|----------------|-----------------------------|--------|
| <kbd>s-r</kbd> | `exwm-reset`                | Switch to `line-mode`;<br />exit fullscreen mode;<br />refresh layout |
| <kbd>s-w</kbd> | `exwm-workspace-switch`     | Interactively switch workspace |
| <kbd>s-N</kbd> | `(exwm-workspace-switch N)` | Switch to workspace `N` (`N` is a digit) |

### Local key bindings
<!-- ...................................................................... -->
Local key bindings are only available in `line-mode`.
The only way to make a local key binding is to modify `exwm-mode-map` with e.g.
`define-key`.
You may have to add the prefix key (first key) of the key sequence to
`exwm-input-prefix-keys` if the prefix key is not already there, e.g.

```elisp
(push ?\C-q exwm-input-prefix-keys)
(define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)
```

Please avoid adding local keys with prefix <kbd>C-c</kbd>;
they are (as a convention) considered mode-specific and reserved for EXWM.
Below is a list of mode-specific keys currently found in EXWM:

| Key            | Command                         | Remark |
|----------------|---------------------------------|--------|
|<kbd>C-c k</kbd>| `exwm-input-release-keyboard`   | Switch to `char-mode` |
|<kbd>C-c f</kbd>| `exwm-layout-set-fullscreen`    | Enter fullscreen mode |
|<kbd>C-c m</kbd>| `exwm-floating-toggle-floating` | Toggle between tiling and floating mode |
|<kbd>C-c q</kbd>| `exwm-input-send-next-key`      | Send a single key to the X window;<br />can be prefixed with <kbd>C-u</kbd> |
|<kbd>C-c v</kbd>| `exwm-workspace-move-window`    | Move X window to another workspace |

### Simulation keys
<!-- ...................................................................... -->
A simulation key exploits a local key binding to map one key sequence to
another and send it to the X window.
There are no predefined simulation keys in EXWM.
One may use `exwm-input-set-simulation-keys` to easily define them, e.g.

```elisp
(exwm-input-set-simulation-keys
 '(([?\C-b] . left)
   ([?\C-f] . right)
   ([?\C-p] . up)
   ([?\C-n] . down)
   ([?\C-a] . home)
   ([?\C-e] . end)
   ([?\M-v] . prior)
   ([?\C-v] . next)))
```

This example enables Emacs-like line-editing keys for normal applications.
Likewise, one should use e.g. <kbd>C-c q C-v</kbd> to send
<kbd>Ctrl</kbd> <kbd>v</kbd> since it's mapped to
<kbd>next</kbd> (<kbd>PgDn</kbd>).

**Note**: Simulation keys are currently sent using `SendEvent` X requests,
so they will not work for a minority of applications.
Some of them can be configured to accept synthetic events however.
For example, you can enable the `allowSendEvents` X resource of `xterm` to
achieve this.

### Button-related key bindings
<!-- ...................................................................... -->
Button-related key bindings are only used when moving/resizing an X window.
Currently there are only two such use cases:

| Key                           | Variable                  | Remark          |
|-------------------------------|---------------------------|-----------------|
| <kbd>s-\<down-mouse-1\></kbd> | `exwm-input-move-event`   | Move X window   |
| <kbd>s-\<down-mouse-3\></kbd> | `exwm-input-resize-event` | Resize X window |

You may change the behaviors by setting the corresponding variables.
Be sure to include a button-down event (e.g. <kbd>\<down-mouse-1\></kbd>)
in the key sequence to make it sense.

## Layout modes
<!-- ...................................................................... -->
There are three layout modes supported in EXWM, i.e. tiling, floating and
(inaccurately) fullscreen.

There is nothing special about the tiling mode.
An X window is shown where its underlying buffer is displayed.
You can use <kbd>C-x b</kbd>, <kbd>C-x 1</kbd>, <kbd>C-x 2</kbd>,
<kbd>C-x 3</kbd> or whatever you normally use to switch buffer / resize Emacs
window.

The floating mode is a bit different.
An extra Emacs frame is created to hold the X window.
By default, a floating X window can be moved (or resized) by holding
<kbd>s-\<down-mouse-1\></kbd> (or <kbd>s-\<down-mouse-3\></kbd>)
when dragging the mouse.
You can alternatively move the window with `exwm-floating-move` or resize it
with `exwm-layout-{enlarge,shrink}-window[-horizontally]` which by default are
not bound.

We regard fullscreen as a third layout mode here.
An X window in either tiling or floating mode can be made fullscreen explicitly
by invoking <kbd>C-c f</kbd>.
If the X window provides other approaches
(typically like pressing <kbd>F11</kbd> or clicking a certain menu entry),
they should also work.
One can leave fullscreen mode with the versatile `exwm-reset`.

## Workspace
<!-- ...................................................................... -->
EXWM by default creates 4 workspaces. You may change the number to e.g. 10 with

```elisp
(setq exwm-workspace-number 10)
```

`exwm-workspace-switch`, when called with no argument, allows you to switch
workspace interactively.
You will be provided with a prompt like

```
 0 [1] 2  3
```

where `[1]` indicates you are currently working in Workspace 1.
You may now switch to another workspace by pressing the corresponding index,
or moving `[ ]` with line-editing keys followed by a <kbd>\<return\></kbd>.

`exwm-workspace-switch` optionally accepts an argument to directly switch to
the target workspace.

An X window can be moved to another workspace with <kbd>C-c v</kbd>.

## RandR (multi-screen)
<!-- ...................................................................... -->
The RandR support is optional and disabled by default.
To enable it, add the following code to your `.emacs`:

```elisp
(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(0 "VGA1"))
(exwm-randr-enable)
```

The second line actually configures the multiple screens support.
The variable `exwm-randr-workspace-output-plist` is a property list of the form
`(workspace-number-1 output-name-1 workspace-number-2 output-name-2 ...)`.
You can find a list of output names together with their info by invoking
`xrandr` utility.

`xrandr` should also be used to properly configure RandR for X server when a
monitor is attached/detached, e.g.:

```shell
xrandr --output VGA1 --left-of LVDS1 --auto
```

This example puts output `VGA1` on the left of `LVDS1` and automatically
resizes the screen.
Please refer to `xrandr(1)` for the detailed usage of `xrandr`.

## One last thing
<!-- ...................................................................... -->
EXWM cannot make an X window manager by itself; you must tell X to do it.
So first in your `~/.xinitrc`, put a line

```shell
exec emacs
```

to launch Emacs when X starts.
Sometimes you should disable access control by prepending a line to this file
if you get a *No protocol specified* error:

```shell
xhost +
```

Then EXWM can be launched in console with

```
xinit
```

On some systems you should instead use

```shell
xinit -- vt01
```

where `vt01` indicates you are starting X from `tty1`.

## Appendices
<!-- ...................................................................... -->
### FAQ
<!-- ...................................................................... -->
#### How to report a bug?
<!-- ...................................................................... -->
1. Make sure you are using the most updated code (including XELB).
2. Check the [issues tracker](https://github.com/ch11ng/exwm/issues) to see
   whether this has been reported/fixed.
3. If not, try to reproduce it use a source (rather than byte-compiled)
   installation with the following code in your `.emacs` (add it before loading
   XELB/EXWM; comment out the second line if this bug makes Emacs frozen, then
   use <kbd>C-g</kbd> to quit):

   ```elisp
   (setq debug-on-error t)
   ;; (setq debug-on-quit t)
   (setq edebug-all-forms t)
   (setq exwm-debug-on t)
   ```

4. Open an issue with a descriptive title, the *bug* label selected, and the
   following contents:
   * A detailed description of the problem, perhaps with contents from
   `*Backtrace*` and `*Messages*` buffers
   * Minimal steps to reproduce it
   * The cause of the problem if you have find it out
   * Emacs version, architecture, UI toolkit; system / X server info

#### Is EXWM stable enough for daily use?
<!-- ...................................................................... -->
No, but I think it will be someday.
In fact I personally use it as my primary X window manager.
Please install a secondary one if you really want to try it.

#### Efficiency? Concurrency?
<!-- ...................................................................... -->
XELB/EXWM are efficient enough to handle most X11 transactions.
They also run concurrently.

#### Font size too small on HiDPI displays
<!-- ...................................................................... -->
This is not an X window manager issue.
Please refer to [this ArchWiki](https://wiki.archlinux.org/index.php/HiDPI) on
how to fix this problem.

#### Will there be a Wayland port?
<!-- ...................................................................... -->
Perhaps, but Emacs itself should have a Wayland port first.

As with X11, Wayland is also a network protocol and can be implemented as
Elisp libraries just like XELB.
Indeed, I (@ch11ng) once made some (unpublished) POC code, but there is very
little I can do with it.
I turns out it's not possible to implement a Wayland compositor (server) with
pure Elisp; we have to find a workaround.

### Known issues
<!-- ...................................................................... -->
#### Issues caused by the single-threaded nature of Emacs
<!-- ...................................................................... -->
EXWM runs concurrently, but it is only true when the event loop of Emacs is not
blocked.
However, because Emacs is currently single-threaded, this seems inevitable in
some situations especially when Emacs tries to display some UI widgets:

* Widgets such as menus which have `OverrideRedirect` set may have a chance to
  work.
* Other widgets like dialog boxes probably can not work at all:
  they would keep waiting for responses from the X window manager but
  unfortunately EXWM would have been blocked by that time.

The workaround to this issue is to avoid the use of these features or turn to
their text-based alternatives.
For instance, most menus can be accessed through <kbd>M-\`</kbd>, and dialog
boxes (including file dialoges) can be disabled by setting `use-dialog-box` to
nil.

#### Hourglass cursor prevents mouse input
<!-- ...................................................................... -->
This issue is closely related to the previous one.
After certain operations such as reading a large file, hourglass windows would
be created by Emacs to display the hourglass cursor, but they might not get
unmapped after that.
This would make mouse input not functional.
One possible solution is to press <kbd>F10</kbd> first and then press
<kbd>esc</kbd> after a few seconds.

#### Input focus issues
<!-- ...................................................................... -->
The current mechanism for setting input focus in EXWM is not perfect and might
fail sometimes.
A single click on the X window losing focus shall help it acquire the input
focus again.

#### An issue with `ido-mode`
<!-- ...................................................................... -->
When switching to a buffer (not in `exwm-mode`) currently displayed on another
workspace (frame), `ido-mode` would raise that workspace instead of displaying
the buffer in the selected Emacs window.
This is probably an unwanted behavior and can be disabled by adding

```elisp
(exwm-enable-ido-workaround)
```

to your `.emacs`.

### Public interfaces
<!-- ...................................................................... -->
This section contains lists of public interfaces that you might find useful
when customizing EXWM.
Please refer to their documentations for more details.

#### List of commands/functions
* `exwm-disable-ido-workaround`
* `exwm-enable`
* `exwm-enable-ido-workaround`
* `exwm-floating-hide-mode-line`
* `exwm-floating-move`
* `exwm-floating-show-mode-line`
* `exwm-floating-toggle-floating`
* `exwm-init`
* `exwm-input-grab-keyboard`
* `exwm-input-release-keyboard`
* `exwm-input-send-next-key`
* `exwm-input-send-simulation-key`
* `exwm-input-set-key`
* `exwm-input-set-simulation-keys`
* `exwm-layout-enlarge-window`
* `exwm-layout-enlarge-window-horizontally`
* `exwm-layout-shrink-window`
* `exwm-layout-shrink-window-horizontally`
* `exwm-layout-set-fullscreen`
* `exwm-layout-unset-fullscreen`
* `exwm-randr-enable`
* `exwm-reset`
* `exwm-workspace-move-window`
* `exwm-workspace-rename-buffer`
* `exwm-workspace-switch`
* `exwm-workspace-switch-to-buffer`

#### List of hooks
* `exwm-floating-exit-hook`
* `exwm-floating-setup-hook`
* `exwm-init-hook`
* `exwm-manage-finish-hook`
* `exwm-update-class-hook`
* `exwm-update-title-hook`

#### List of global variables
* `exwm-debug-on` (should be set before loading EXWM)
* `exwm-floating-border-color`
* `exwm-floating-border-width`
* `exwm-input-move-event`
* `exwm-input-resize-event`
* `exwm-layout-show-all-buffers`
* `exwm-manage-ping-timeout`
* `exwm-mode-map`
* `exwm-input-prefix-keys`
* `exwm-randr-workspace-output-plist`
* `exwm-workspace-current-index`
* `exwm-workspace-number`
* `exwm-workspace-show-all-buffers`

#### List of buffer-local variables
* `exwm-class-name`
* `exwm-instance-name`
* `exwm-state`
* `exwm-title`
* `exwm-transient-for`
* `exwm-window-type`

### Contributing
<!-- ...................................................................... -->
Both XELB and EXWM are dual-hosted on GitHub and GNU Savannah.
GNU Emacs developers may bypass me and make changes to these projects directly;
I will keep both repositories in sync.
However, due to copyright issues we cannot accept
[significant changes](https://www.gnu.org/prep/maintain/maintain.html#Legally-Significant)
from other developers.
If you want to contribute though, you still have several options:

* Complete the copyright assignment paperwork and become a GNU contributor.
* Instead of implementing a feature, you may introduce the idea.
* You might as well present a draft implementation so that we'll reimplement
  it later.

Note that the copyright restriction does not apply to minor changes or
modifications of the wiki pages here.
