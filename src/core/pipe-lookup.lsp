;; PIPE SCHEDULE → PIPE ID

(defun pipe:get (nps schedule data / row od thk)
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
    (progn
      (setq od  (cdr (assoc "OD" row)))
      (setq thk (cdr (assoc schedule row)))

      (if (and thk (> thk 0))
        (list
          (cons 'NPS nps)
          (cons 'OD od)
          (cons 'THK thk)
          (cons 'ID (- od (* 2 thk)))
        )
      )
    )
  )
)