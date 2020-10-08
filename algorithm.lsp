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
		(if (equal current final) 
			(setq result T)
			(progn
				(setq closed (append closed current))
				
			)
		)
	)
)

(defun main ()
	(setq final_state (get_final_state)) 
	(setq initial_state (get_initial_state)) 
	(BFS initial_state final_state)
	;;(print (operator initial_state))
)

(main)
