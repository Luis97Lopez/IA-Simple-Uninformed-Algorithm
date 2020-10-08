;; ------------------------------
;;        USEFUL FUNCTIONS
;; ------------------------------

;; ------------------------------
;;     ALGORITHM FUNCTIONS
;; ------------------------------

;; RETURN THE FINAL STATE
(defun get_final_state ()
	(list 1 2 3 4))

;; RETURN THE INITIAL STATE
(defun get_initial_state ()
	(list 4 3 2 1))


;; Breadth First Search
(defun BFS (initial final)
	;; VARIABLES
	(setq opened (list initial))
	(setq closed (list))
	(setq result NIL)

	;; MAIN LOOP
	(loop 
		(when (or (eq result T) (= (length opened) 0)) (return)) ;; RETURN CONDITION
		(setq current (car opened))
		(if (equal current final) 
			(setq result T)
			(print current)
		)
	)
)

(defun main ()
	(setq final_state (get_final_state)) 
	(setq initial_state (get_initial_state)) 
	(BFS initial_state final_state)
)

(main)
