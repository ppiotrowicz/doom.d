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
       (ivy +childframe)

       :ui
       deft
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       hl-todo
       hydra
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
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       format            ; automated prettiness
       multiple-cursors  ; editing in many places at once
       ;;rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       ibuffer           ; interactive buffer management
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm

       :checkers
       syntax              ; tasing you for every semicolon you forget
       ;;spell             ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       docker
       (eval +overlay)     ; run code, run (also, repls)
       (lookup             ; helps you navigate your code and documentation
        +docsets)          ; ...or in Dash docsets locally
       lsp
       ;;macos             ; MacOS-specific commands
       magit               ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       pdf                ; pdf enhancements
       terraform           ; infrastructure as code

       :lang
       ;;agda              ; types of types of types of types...
       ;;assembly          ; assembly for fun or debugging
       ;;cc                ; C/C++/Obj-C madness
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       data                ; config/data formats
       (elixir +lsp)       ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp          ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;faust             ; dsp, but you get to keep your soul
       ;;fsharp            ; ML stands for Microsoft's Language
       (go  +lsp)          ; the hipster dialect
       ;;(haskell +dante)  ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ;
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       ;;javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean
       ;;factor
       ledger            ; an accounting system in Emacs
       ;;lua               ; one-based indices? one-based indices
       (markdown +grip)    ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org                ; organize your plain life in plain text
        ;;+dragndrop         ; drag & drop files/images into org buffers
        ;;+hugo            ; use Emacs for hugo blogging
        ;;+jupyter         ; ipython/jupyter support for babel
        ;;+pandoc          ; export-with-pandoc support
        ;;+pomodoro        ; be fruitful with the tomato technique
        +present)          ; using org-mode for presentations
       ;;perl              ; write code no one else can comprehend
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       (python +lsp)       ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       rest                ; Emacs as a REST client
       ;;rst               ; ReST in peace
       (ruby +lsp +rails)  ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;scheme            ; a fully conniving family of lisps
       sh                  ; she sells {ba,z,fi}sh shells on the C xor
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       ;;web               ; the tubes

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
