;; ------------------------------------------------------------
;; CSV LOADER FOR ASME B16.5 Class 150# flanges
;; Supports:
;; - semicolons
;; - comma decimals → dot decimals
;; - empty fields
;; - automatic header parsing
;; - output as association lists
;; ------------------------------------------------------------

(defun csv:split (str sep / lst pos)
  (setq lst '())
  (while (setq pos (vl-string-search sep str))
    (setq lst (cons (substr str 1 pos) lst))
    (setq str (substr str (+ pos (strlen sep)) 1))
  )
  (reverse (cons str lst))
)

(defun csv:normalize (s)
  ;; remove spaces, replace comma with dot
  (if s
    (vl-string-subst "." "," (vl-string-trim " " s))
    ""
  )
)

(defun csv:load (file / f line header fields rows)
  (setq f (open file "r"))
  (setq rows '())

  ;; --- read header ---
  (setq header (csv:split (read-line f) ";"))

  ;; --- read each row ---
  (while (setq line (read-line f))
    (setq fields (mapcar 'csv:normalize (csv:split line ";")))

    ;; build association list: (("NPS" . "0.5") ("outside_diameter_flange" . "89") ...)
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
