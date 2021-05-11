;;;; Generate histograms for documentation's purposes
(asdf:load-systems "histogram" "exp-dev")

(let ((vals (make-array 1000000))
      (hist)
      (hist-file-root
        (format nil "~A"
                (asdf:system-relative-pathname "exp-dev" "doc/exp-")))
      (hist-file))
  (loop for rate in '(0.5 1 1.5) do
    (loop for i from 0 below (length vals) do
      (setf (aref vals i) (exp-dev:draw rate)))
    (setf hist (histogram:make-hist '(0 5) 1000 :data vals)
          hist-file
          (concatenate 'string hist-file-root (write-to-string rate) ".txt"))
    (histogram:tofile hist hist-file)))
