;;;; Rove test suite for exp-dev
(defpackage exp-dev/test (:use :cl :rove))

(in-package :exp-dev/test)

(deftest exp
  (let ((rate 2d0))
    (testing "Drawing without error."
      (dotimes (it 10) (exp-dev:draw rate))
      (pass "ok"))))

(deftest performance
  (testing "exp-dev: Drawing 1M numbers."
    (time (dotimes (it 1000000 t) (exp-dev:draw 2d0)))))
