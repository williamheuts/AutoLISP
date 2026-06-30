;; ============================================================
;;  CSV LOADER (UNIVERSAL)
;;  - Supports semicolon-separated CSV
;;  - Converts comma decimals → dot decimals
;;  - Handles empty fields
;;  - Auto-parses header row
;;  - Returns association lists
;;  - Converts numeric fields to numbers automatically
;; ============================================================

(defun csv:split (str sep / lst pos)
  (setq lst '())
  (while (setq pos (vl-string-search sep str))
    (setq lst (cons (substr str 1 pos) lst))
    (setq str (substr str (+ pos (strlen sep)) 1))
  )
  (reverse (cons str lst))
)

(defun csv:normalize (s)
  ;; Trim spaces, convert comma-decimals to dot-decimals
  (if (and s (> (strlen s) 0))
    (vl-string-subst "." "," (vl-string-trim " " s))
    ""
  )
)

(defun csv:maybe-number (s)
  ;; Convert to number if possible, otherwise return string
  (if (and (> (strlen s) 0)
           (not (wcmatch s "*[A-Za-z]*")))
    (atof s)
    s
  )
)

(defun csv:load (file / f line header fields rows)
  (setq f (open file "r"))
  (setq rows '())

  ;; --- Read header row ---
  (setq header (csv:split (read-line f) ";"))

  ;; --- Process each row ---
  (while (setq line (read-line f))
    (setq fields
      (mapcar
        '(lambda (x)
           (csv:maybe-number (csv:normalize x))
         )
        (csv:split line ";")
      )
    )

    ;; Build association list: (("NPS" . 2.0) ("OD" . 60.3) ...)
    (setq rows
      (cons
        (mapcar
          '(lambda (h v) (cons h v))
          header
          fields
        )
        rows
      )
    )
  )

  (close f)
  (reverse rows)
)