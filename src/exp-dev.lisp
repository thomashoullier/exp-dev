(in-package :exp-dev)

(defun draw (rate)
  "Draw a pseudorandom number from the exponential distribution with
   rate parameter."
  (/ (- (log (random 1d0))) rate))
