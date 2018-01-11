
(cl:in-package :asdf)

(defsystem "kinect_data-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "skeleton" :depends-on ("_package_skeleton"))
    (:file "_package_skeleton" :depends-on ("_package"))
    (:file "joint" :depends-on ("_package_joint"))
    (:file "_package_joint" :depends-on ("_package"))
    (:file "Num" :depends-on ("_package_Num"))
    (:file "_package_Num" :depends-on ("_package"))
    (:file "skeleton" :depends-on ("_package_skeleton"))
    (:file "_package_skeleton" :depends-on ("_package"))
    (:file "joint" :depends-on ("_package_joint"))
    (:file "_package_joint" :depends-on ("_package"))
    (:file "Num" :depends-on ("_package_Num"))
    (:file "_package_Num" :depends-on ("_package"))
  ))