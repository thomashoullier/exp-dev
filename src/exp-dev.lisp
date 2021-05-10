(in-package :exp-dev)

;;; Exponential generator.
(defclass exp-gen ()
  ((rate :documentation "Rate parameter (lambda)."
         :reader rate :initarg :rate)))

(defun make-exp-gen (rate)
  "Instantiate an exponential deviates generator with rate parameter."
  (make-instance 'exp-gen :rate rate))

(defmethod draw ((exp-gen exp-gen))
  "Draw a pseudorandom number using the exponential generator."
  (with-slots ((rate rate)) exp-gen
    (/ (- (log (random 1d0))) rate)))
