(asdf:defsystem "learn-gtk"
  :depends-on (:alexandria :cl-gtk4 :cl-gdk4)
  :components ((:module "src"
                :components ((:file "package")
                             (:file "widget")
                             (:file "string-list")
                             (:file "generic-string-list")
                             (:file "prompt")
                             (:file "inspector")
                             (:file "toplevel")))))
