(in-package :cl-user)
(defpackage cl-verm
  (:use :cl)
  (:export :deep-copy :add-index :commit :checkout :add))
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
    ((lambda (var)
       (lambda ()
         (setq ,var var))) ,(deep-copy var))))
