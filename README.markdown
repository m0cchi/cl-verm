# Cl-Verm: 

## Usage
```common-lisp
(defvar name "m0cchi")
(defvar greeting "Hello")
(add name)
(add greeting)
(defun dump () (format nil "~a ~a" greeting name))
(dump)
;=> Hello m0cchi
(commit "mocchi")
(setq name "taro")
(dump)
;=> Hello taro
(checkout 0)
(dump)
;=> Hello m0cchi
```

## Installation
;; (ql:quickload :cl-verm)
## Author

* m0cchi

## Copyright

Copyright (c) 2016 m0cchi

## License

Licensed under the BSD License.
