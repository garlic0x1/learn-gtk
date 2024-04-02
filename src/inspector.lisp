(in-package :learn-gtk)

(defclass list-view (generic-string-list*)
  ((value
    :initarg :value
    :initform (error "Must provide value")
    :accessor value)))

(defmethod initialize-instance :after ((self list-view) &key &allow-other-keys)
  (loop :for it :in (value self)
        :do (generic-string-list*-append self (list it))))

(defgeneric inspector-view-class (value)
  (:method ((value list))             'list-view)
  )

(defclass inspector ()
  ((widget
    :initform nil
    :accessor widget)
   (value
    :initarg :value
    :initform nil
    :accessor value)
   (stack
    :initform '()
    :accessor stack)))

(defmethod initialize-instance :after ((self inspector) &key &allow-other-keys)
  (let* ((init-val (value self))
         (grid (make-grid))
         (label (make-label :str ""))
         (pop-button (make-button :label "Pop"))
         (view (make-instance (inspector-view-class init-val) :value init-val)))
    (inspector-push self init-val)
    (grid-attach grid label 0 0 1 1)
    (grid-attach grid pop-button 1 0 1 1)
    (grid-attach grid (widget view) 0 1 2 1)
    (setf (widget self) grid)))

(defun inspector-push (self value)
  (push value (stack self))
  )
