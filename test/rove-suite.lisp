;;;; Rove test suite for exp-dev
(defpackage exp-dev/test (:use :cl :rove))

(in-package :exp-dev/test)

(deftest exp
  (let ((generator) (rate 2d0))
    (testing "Instantiation"
      (setf generator (exp-dev:make-exp-gen rate)) (pass "ok"))
    (testing "Reading parameters back"
      (ok (= rate (exp-dev:rate generator)) "ok"))
    (testing "Drawing without error."
      (dotimes (it 10) (exp-dev:draw generator))
      (pass "ok"))))

(deftest performance
  (testing "exp-dev: Drawing 1M numbers."
    (let ((generator (exp-dev:make-exp-gen 2d0)))
      (time (dotimes (it 1000000 t) (exp-dev:draw generator))))))
