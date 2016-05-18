#|
  This file is a part of cl-verm project.
  Copyright (c) 2016 m0cchi
|#

#|
  Author: m0cchi
|#

(in-package :cl-user)
(defpackage cl-verm-asd
  (:use :cl :asdf))
(in-package :cl-verm-asd)

(defsystem cl-verm
  :version "0.1"
  :author "m0cchi"
  :license "BSD"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "cl-verm"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-verm-test))))
