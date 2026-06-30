;; FLANGE BORE = PIPE ID

(defun flg:match-bore (flangeRec pipeRec)
  (subst (cons 'Bore (cdr (assoc 'ID pipeRec)))
         (assoc 'Bore flangeRec)
         flangeRec
  )
)