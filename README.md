# Hold-My-Cup

### OtpGenerator.py
Estimates the object transfer point for the handover and publishes it as a `pos.msg` message

`rosrun otp OtpGenerator.py`

### pyclient.py
Recieves human skeleton data sent from the java server and publishes it as a `skeleton.msg` message

`rosrun kinect_data pyclient.py`
