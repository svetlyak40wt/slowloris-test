(uiop:define-package #:slowloris-test/server
  (:use #:cl)
  (:import-from #:clack)
  (:import-from #:woo)
  (:import-from #:hunchentoot)
  (:export #:start-woo
           #:start-woo-multithread
           #:start-hunchentoot))
(in-package #:slowloris-test/server)


(defun fast-app (env)
  (declare (ignore env))
  '(200 (:content-type "text/plain")
    ("Hello, World")))


(defun slow-app (env)
  (declare (ignore env))
  (sleep 1)
  '(200 (:content-type "text/plain")
    ("Hello, World")))


(defvar *woo-server* nil)
(defvar *woo-multi-server* nil)
(defvar *hunchentoot-server* nil)


(defun start-woo (&key slow)
  (setf *woo-server*
        (clack:clackup
         (if slow
             #'slow-app
             #'fast-app)
         :server :woo
         :use-default-middlewares nil
         :address "0.0.0.0"
         :port 9001)))


(defun start-woo-multithread (&key slow)
  (when *woo-multi-server*
    (clack:stop *woo-multi-server*))

  (setf *woo-multi-server*
        (clack:clackup
         (if slow
             #'slow-app
             #'fast-app)
         :server :woo
         :use-default-middlewares nil
         :address "0.0.0.0"
         :port 9003
         :worker-num 10)))


(defun start-hunchentoot (&key slow)
  (setf *hunchentoot-server*
        (clack:clackup
         (if slow
             #'slow-app
             #'fast-app)
         :server :hunchentoot
         :use-default-middlewares nil
         :address "0.0.0.0"
         :port 9002)))
