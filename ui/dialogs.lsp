;; UI controller for flange selection

(defun ui:flange (/ dcl_id nps_list sch_list class_list nps sch class result)

  (setq nps_list '("0.5" "0.75" "1" "1.25" "1.5" "2" "2.5" "3" "3.5" "4" "5" "6" "8" "10" "12" "14" "16" "18" "20" "22" "24"))
  (setq sch_list '("SCH.5" "SCH.5S" "SCH.10" "SCH.10S" "SCH.20" "SCH.30" "SCH.40" "SCH.40S"
                   "SCH.60" "SCH.80" "SCH.80S" "SCH.100" "SCH.120" "SCH.140" "SCH.160"
                   "STD" "XS" "XXS"))
  (setq class_list '("150" "300"))

  (setq dcl_id (load_dialog "main.dcl"))
  (if (not (new_dialog "flange_ui" dcl_id))
    (progn (unload_dialog dcl_id) (exit))
  )

  (start_list "nps")   (mapcar 'add_list nps_list)   (end_list)
  (start_list "sch")   (mapcar 'add_list sch_list)   (end_list)
  (start_list "class") (mapcar 'add_list class_list) (end_list)

  (action_tile "ok"
    "(setq nps (atof (nth (get_tile \"nps\") nps_list)))
     (setq sch (nth (get_tile \"sch\") sch_list))
     (setq class (atoi (nth (get_tile \"class\") class_list)))
     (done_dialog 1)"
  )

  (action_tile "cancel" "(done_dialog 0)")

  (setq result (start_dialog))
  (unload_dialog dcl_id)

  (if (= result 1)
    (list nps sch class)
    nil
  )
)