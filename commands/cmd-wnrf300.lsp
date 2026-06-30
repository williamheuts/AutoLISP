;; Optional direct command for 300# only

(defun c:WNRF300 (/ nps rec)
  (setq nps (getreal "\nNPS (in): "))
  (setq rec (flg:get nps 300))
  (if rec
    (flg:draw-wnrf rec)
    (prompt "\nGeen data voor deze NPS in 300#."))
  (princ)
)