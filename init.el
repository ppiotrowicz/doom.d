;;; init.el -*- lexical-binding: t; -*-

;; Copy this file to ~/.doom.d/init.el or ~/.config/doom/init.el ('doom install'
;; will do this for you). The `doom!' block below controls what modules are
;; enabled and in what order they will be loaded. Remember to run 'doom refresh'
;; after modifying it.
;;
;; More information about these modules (and what flags they support) can be
;; found in modules/README.org.

(doom! :input

       :completion
       (company +childframe)
       (ivy +childframe +icons)

       :ui
       deft
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +github)
       hl-todo
       hydra
       ligatures
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       ;;pretty-code       ; replace bits of code with pretty symbols
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       ;; zen            ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       format            ; automated prettiness
       multiple-cursors  ; editing in many places at once
       snippets          ; my elves. They type so I don't have to

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm

       :checkers
       (syntax +childframe) ; tasing you for every semicolon you forget
       ;;spell             ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       (docker +lsp)
       ;; ein
       (eval +overlay)     ; run code, run (also, repls)
       (lookup             ; helps you navigate your code and documentation
        +docsets)          ; ...or in Dash docsets locally
       lsp
       ;;macos             ; MacOS-specific commands
       magit               ; a git porcelain for Emacs
       make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       pdf                ; pdf enhancements
       rgb

       :lang
       ;;data                ; config/data formats
       (elixir +lsp)       ; erlang done right
       emacs-lisp          ; drown in parentheses
       javascript          ; all(hope(abandon(ye(who(enter(here))))))
       (json +lsp)         ; At least it ain't XML
       ledger              ; an accounting system in Emacs
       (markdown +grip)    ; writing docs for people to ignore
       (org                ; organize your plain life in plain text
        ;;+dragndrop         ; drag & drop files/images into org buffers
        ;;+hugo            ; use Emacs for hugo blogging
        ;;+jupyter         ; ipython/jupyter support for babel
        ;;+pandoc          ; export-with-pandoc support
        ;;+pomodoro        ; be fruitful with the tomato technique
        ;;+present)          ; using org-mode for presentations
       )
       ;;(python +lsp)       ; beautiful is better than ugly
       rest                ; Emacs as a REST client
       ;;rst               ; ReST in peace
       (ruby +rbenv)       ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh +lsp)           ; she sells {ba,z,fi}sh shells on the C xor
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       (web +lsp)          ; the tubes
       yaml                ; JSON, but readable

       :email
       ;;(mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       ;;write             ; emacs for writers (fiction, notes, papers, etc.)

       :config
       ;;literate
       (default +bindings +smartparens))
