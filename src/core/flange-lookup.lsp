;; FLANGE LOOKUP 150 / 300

(defun flg:get (nps class / data row)
  (setq data
    (cond
      ((= class 150) *flg150*)
      ((= class 300) *flg300*)
    )
  )

  (setq row
    (vl-some
      '(lambda (r)
         (if (= (cdr (assoc "NPS" r)) nps)
           r
         )
       )
      data
    )
  )

  (if row
    (list
      (cons 'NPS   (cdr (assoc "NPS" row)))
      (cons 'OD    (cdr (assoc "FLANGE_OD" row)))
      (cons 'T     (cdr (assoc "FLANGE_THK" row)))
      (cons 'Dhub  (cdr (assoc "HUB_DIA" row)))
      (cons 'Chamfer (cdr (assoc "CHAMFER" row)))
      (cons 'HubLen (cdr (assoc "HEIGHT" row)))
      (cons 'Bore  (cdr (assoc "BORE" row)))
      (cons 'BC    (cdr (assoc "BCD" row)))
      (cons 'HoleDia (cdr (assoc "BHD" row)))
      (cons 'Bolts (cdr (assoc "NOBOLTS" row)))
      (cons 'RFh   (cdr (assoc "RF_HEIGHT" row)))
      (cons 'RFod  (cdr (assoc "RF_OD" row)))
    )
  )
)