# Search Engine contribution layer for Spacemacs

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc/generate-toc again -->
**Table of Contents**

- [Search Engine contribution layer for Spacemacs](#search-engine-contribution-layer-for-spacemacs)
    - [Description](#description)
    - [Install](#install)
    - [Key Bindings](#key-bindings)

<!-- markdown-toc end -->
    
## Description

This layer adds support for the [Search Engine][] package.

Supported search engines:

- [Amazon][]
- [Duck Duck Go][]
- [Google][]
- [Google Images][]
- [Github][]
- [Google Maps][]
- [Twitter][]
- [Project Gutemberg][]
- [Youtube][]
- [Stack Overflow][]
- [Wikipedia][]
- [Wolfram Alpha][]

## Install

To use this contribution add it to your `~/.spacemacs`

```elisp
(setq-default dotspacemacs-configuration-layers '(search-engine))
```
    
## Key Bindings

        Evil         |         Holy          |         Search Engine
---------------------|------------------------------------------------------------
<kbd>SPC a / a</kbd> |   <kbd>C-c / a</kbd>  |    [Amazon]
<kbd>SPC a / d</kbd> |   <kbd>C-c / d</kbd>  |    [Duck Duck Go]
<kbd>SPC a / g</kbd> |   <kbd>C-c / g</kbd>  |    [Google]
<kbd>SPC a / i</kbd> |   <kbd>C-c / i</kbd>  |    [Google Images]
<kbd>SPC a / G</kbd> |   <kbd>C-c / G</kbd>  |    [Github]
<kbd>SPC a / m</kbd> |   <kbd>C-c / m</kbd>  |    [Google Maps]
<kbd>SPC a / t</kbd> |   <kbd>C-c / t</kbd>  |    [Twitter]
<kbd>SPC a / b</kbd> |   <kbd>C-c / b</kbd>  |    [Project Gutemberg]
<kbd>SPC a / y</kbd> |   <kbd>C-c / y</kbd>  |    [YouTube]
<kbd>SPC a / s</kbd> |   <kbd>C-c / s</kbd>  |    [Stack Overflow]
<kbd>SPC a / w</kbd> |   <kbd>C-c / w</kbd>  |    [Wikipedia]
<kbd>SPC a / W</kbd> |   <kbd>C-c / W</kbd>  |    [Wolfram Alpha]

## Customize it!

If you'd rather have emacs use chrome, or firefox or any other thing (`eww`) you
can have that customization. For example for google chrome you can put this in
your `dotspacemacs/config`:

```elisp
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "google-chrome")
```

[Search Engine]: https://github.com/hrs/engine-mode/engine-mode.el
[Amazon]: http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s
[Duck Duck Go]: https://duckduckgo.com/?q=%s
[Google]: http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s
[Google Images]: http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s
[Github]: https://github.com/search?ref=simplesearch&q=%s
[Google Maps]: http://maps.google.com/maps?q=%s
[Twitter]: https://twitter.com/search?q=%s
[Project Gutemberg]: http://www.gutenberg.org/ebooks/search.html/?format=html&default_prefix=all&sort_order=&query=%s
[Youtube]: http://www.youtube.com/results?aq=f&oq=&search_query=%s
[Stack Overflow]: https://stackoverflow.com/search?q=%s
[Wikipedia]: http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s
[Wolfram Alpha]: http://www.wolframalpha.com/input/?i=%s
