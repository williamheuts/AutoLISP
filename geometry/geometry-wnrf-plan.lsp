;; Plan view WN RF flange

(defun flg:draw-wnrf (rec / pt od bc bolts holeDia bore rfod ang i)
  (setq pt      (getpoint "\nFlens centrum: "))
  (setq od      (cdr (assoc 'OD rec)))
  (setq bc      (cdr (assoc 'BC rec)))
  (setq bolts   (cdr (assoc 'Bolts rec)))
  (setq holeDia (cdr (assoc 'HoleDia rec)))
  (setq bore    (cdr (assoc 'Bore rec)))
  (setq rfod    (cdr (assoc 'RFod rec)))

  (command "_.circle" pt (/ od 2.0))
  (command "_.circle" pt (/ rfod 2.0))
  (command "_.circle" pt (/ bore 2.0))

  (setq ang (/ (* 2.0 pi) bolts)
        i   0)

  (repeat bolts
    (command "_.circle"
             (polar pt (* i ang) (/ bc 2.0))
             (/ holeDia 2.0))
    (setq i (1+ i))
  )
  (princ)
)