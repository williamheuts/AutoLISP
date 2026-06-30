;; Main command: FLANGEGEN

(defun c:FLANGEGEN (/ sel pipeRec flgRec finalRec)
  (setq sel (ui:flange))

  (if sel
    (progn
      (setq pipeRec (pipe:get (car sel) (cadr sel) *pipeData*))
      (setq flgRec  (flg:get (car sel) (caddr sel)))

      (if (and pipeRec flgRec)
        (progn
          (setq finalRec (flg:match-bore flgRec pipeRec))
          (flg:draw-wnrf finalRec)
        )
        (prompt "\nGeen data voor deze combinatie.")
      )
    )
  )
  (princ)
)