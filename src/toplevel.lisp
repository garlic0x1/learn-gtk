(in-package :learn-gtk)

(defun make-completion (selection &key (test #'search))
  (lambda (str) (remove-if-not (alexandria:curry test str) selection)))

(defparameter *test-completion* (make-completion '("hi" "help" "hello" "heck")))

(define-application (:name main)
  (define-main-window (w (make-application-window :application *application*))
    (setf (window-child w)
          (gobject (make-instance 'prompt
                                  :completion *test-completion*
                                  :callback 'print)))
    ;; (let ((insp (make-instance 'inspector :value '(:hi :world))))
    ;;   (setf (window-child w) (widget insp)))
    (unless (widget-visible-p w)
      (window-present w))))
