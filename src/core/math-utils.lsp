;; Generic math helpers (stub)

(defun mu:deg->rad (a)
  (* pi (/ a 180.0))
)

(defun mu:rad->deg (r)
  (* 180.0 (/ r pi))
)