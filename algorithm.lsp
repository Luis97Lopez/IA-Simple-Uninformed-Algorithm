;; ------------------------------
;;     USEFUL FUNCTIONS
;; ------------------------------

(defun is_list_in_queue (_list queue)
	(loop for l in queue do
		(when (equal l _list)
			(return T))
	)
)

;; ------------------------------
;;     ALGORITHM FUNCTIONS
;; ------------------------------

;; RETURN THE FINAL STATE
(defun get_final_state ()
	(list 1 2 3 4))


;; RETURN THE INITIAL STATE
(defun get_initial_state ()
	(list 4 3 2 1))


;; GENERATE STATES 
(defun operator (list)
	(let ((states_list (list (copy-list list) (copy-list list) (copy-list list) (copy-list list))))
		(loop for i from 0 to (- (length list) 1) do
			(let ((j (mod (+ i 1) 4)))
				(setf (nth (mod (+ i 0) 4) (nth 0 states_list)) (nth j list))
				(setf (nth (mod (+ i 1) 4) (nth 1 states_list)) (nth j list))
				(setf (nth (mod (+ i 2) 4) (nth 2 states_list)) (nth j list))
				(setf (nth (mod (+ i 3) 4) (nth 3 states_list)) (nth j list))
			)
		)
		states_list
	)
)


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
		(setq opened (cdr opened))


		(print '(----------))
		(print opened)
		(print closed)
		(print current)
		
		(if (equal current final) 
			(setq result T)
			(progn
				(setq closed (append closed (list current)))
				(setq new_states (operator current))
				(loop for new in new_states do
					(if (and 	(not (is_list_in_queue new opened)) 
							(not (is_list_in_queue new closed)))
						(setq opened (append opened (list new))))
				)
			)
		)
	)
)

(defun main ()
	(setq final_state (get_final_state)) 
	(setq initial_state (get_initial_state)) 
	(print (BFS initial_state final_state))
)

(main)
