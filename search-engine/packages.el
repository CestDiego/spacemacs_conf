;;; packages.el --- search-engine Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(defvar search-engine-packages
  '(
    engine-mode
    ))

(defun search-engine/init-engine-mode ()
  (use-package engine-mode
    :init
    (spacemacs/declare-prefix "a/" "Search Engines")
    (evil-leader/set-key
      "a/a" 'engine/search-amazon
      "a/d" 'engine/search-duckduckgo
      "a/g" 'engine/search-google
      "a/i" 'engine/search-google-images
      "a/G" 'engine/search-github
      "a/m" 'engine/search-google-maps
      "a/t" 'engine/search-twitter
      "a/b" 'engine/search-project-gutemberg
      "a/y" 'engine/search-youtube
      "a/s" 'engine/search-stack-overflow
      "a/w" 'engine/search-wikipedia
      "a/W" 'engine/search-wolfram-alpha
      )
    :config
    (engine-mode t)
    (defengine amazon
      "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=%s"
      :keybinding "a")
    (defengine duckduckgo
      "https://duckduckgo.com/?q=%s"
      :keybinding "d")
    (defengine github
      "https://github.com/search?ref=simplesearch&q=%s"
      :keybinding "G")
    (defengine google
      "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
      :keybinding "g")
    (defengine google-images
      "http://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s"
      :keybinding "i")
    (defengine google-maps
      "http://maps.google.com/maps?q=%s"
      :keybinding "m"
      :docstring "Mappin' it up.")
    (defengine project-gutenberg
      "http://www.gutenberg.org/ebooks/search.html/?format=html&default_prefix=all&sort_order=&query=%s"
      :keybinding "b")
    (defengine stack-overflow
      "https://stackoverflow.com/search?q=%s"
      :keybinding "s")
    (defengine twitter
      "https://twitter.com/search?q=%s"
      :keybinding "t")
    (defengine wikipedia
      "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
      :keybinding "w"
      :docstring "Searchin' the wikis.")
    (defengine wolfram-alpha
      "http://www.wolframalpha.com/input/?i=%s"
      :keybinding "W")
    (defengine youtube
      "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
      :keybinding "y")
    ))
