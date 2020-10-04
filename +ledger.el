(after! ledger-mode
  (add-to-list 'ledger-reports '("Monthly expenses" "%(binary) -f %(ledger-file) reg --monthly ^Expenses"))
  (add-to-list 'ledger-reports '("Current balance" "%(binary) -f %(ledger-file) bal ^Assets:Bank:ING and not Makler Revolut"))
  (add-to-list 'ledger-reports '("Makler" "%(binary) -f %(ledger-file) bal makler -X PLN")))
