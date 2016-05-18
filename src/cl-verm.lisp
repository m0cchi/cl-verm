(in-package :cl-user)
(defpackage cl-verm
  (:use :cl))
(in-package :cl-verm)

(defvar logs '())
(defvar current '())

(defun deep-copy (var)
  var)

(defun add-index (setter)
  (push setter current))

(defun commit (message)
  (push `(:message ,message :data ,current) logs)
  (setq current '()))

(defun checkout (n)
  (loop for x in (getf (nth n logs) :data) do (funcall x)))

(defmacro add (var)
  `(add-index
    ((lambda (x)
       (lambda ()
         (setq ,var x))) ,(deep-copy var))))
