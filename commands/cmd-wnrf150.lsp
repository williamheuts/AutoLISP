;; Optional direct command for 150# only

(defun c:WNRF150 (/ nps rec)
  (setq nps (getreal "\nNPS (in): "))
  (setq rec (flg:get nps 150))
  (if rec
    (flg:draw-wnrf rec)
    (prompt "\nGeen data voor deze NPS in 150#."))
  (princ)
)