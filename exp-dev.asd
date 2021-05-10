(defsystem exp-dev
  :name "exp-dev"
  :author "Thomas HOULLIER"
  :components
  ((:module "src"
    :components ((:file "package")
                 (:file "exp-dev" :depends-on ("package")))))
  :in-order-to ((test-op (test-op "exp-dev/test"))))

(defsystem exp-dev/test
  :name "exp-dev/test"
  :depends-on ("rove" "exp-dev")
  :components
  ((:module "test"
    :components ((:file "rove-suite"))))
  :perform (test-op (o c) (symbol-call :rove '#:run c)))
