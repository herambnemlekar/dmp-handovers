; Auto-generated. Do not edit!


(cl:in-package kinect_data-msg)


;//! \htmlinclude skeleton.msg.html

(cl:defclass <skeleton> (roslisp-msg-protocol:ros-message)
  ((joints
    :reader joints
    :initarg :joints
    :type (cl:vector kinect_data-msg:joint)
   :initform (cl:make-array 4 :element-type 'kinect_data-msg:joint :initial-element (cl:make-instance 'kinect_data-msg:joint))))
)

(cl:defclass skeleton (<skeleton>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <skeleton>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'skeleton)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kinect_data-msg:<skeleton> is deprecated: use kinect_data-msg:skeleton instead.")))

(cl:ensure-generic-function 'joints-val :lambda-list '(m))
(cl:defmethod joints-val ((m <skeleton>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kinect_data-msg:joints-val is deprecated.  Use kinect_data-msg:joints instead.")
  (joints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <skeleton>) ostream)
  "Serializes a message object of type '<skeleton>"
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <skeleton>) istream)
  "Deserializes a message object of type '<skeleton>"
  (cl:setf (cl:slot-value msg 'joints) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'joints)))
    (cl:dotimes (i 4)
    (cl:setf (cl:aref vals i) (cl:make-instance 'kinect_data-msg:joint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<skeleton>)))
  "Returns string type for a message object of type '<skeleton>"
  "kinect_data/skeleton")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'skeleton)))
  "Returns string type for a message object of type 'skeleton"
  "kinect_data/skeleton")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<skeleton>)))
  "Returns md5sum for a message object of type '<skeleton>"
  "870ea4c4d6154329d5d481442838f2f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'skeleton)))
  "Returns md5sum for a message object of type 'skeleton"
  "870ea4c4d6154329d5d481442838f2f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<skeleton>)))
  "Returns full string definition for message of type '<skeleton>"
  (cl:format cl:nil "kinect_data/joint[4] joints ~%~%================================================================================~%MSG: kinect_data/joint~%string joint_name~%float64 x~%float64 y~%float64 z~%float64 stamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'skeleton)))
  "Returns full string definition for message of type 'skeleton"
  (cl:format cl:nil "kinect_data/joint[4] joints ~%~%================================================================================~%MSG: kinect_data/joint~%string joint_name~%float64 x~%float64 y~%float64 z~%float64 stamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <skeleton>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'joints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <skeleton>))
  "Converts a ROS message object to a list"
  (cl:list 'skeleton
    (cl:cons ':joints (joints msg))
))
