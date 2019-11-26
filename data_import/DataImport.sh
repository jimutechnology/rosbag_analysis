#!/bin/sh

mkdir -p $1
rostopic echo -b $1.bag -p /wheel_odometry_data > $1/odometry.txt 
# rostopic echo -b $1.bag -p /formation_cmd > $1/formation.txt
rostopic echo -b $1.bag -p /reference_robot_state > $1/reference_state.txt
rostopic echo -b $1.bag -p /output_robot_state > $1/output_state.txt 
#rostopic echo -b $1.bag -p /formation_cmd > $1/formation_cmd.txt &
rostopic echo -b $1.bag -p /front_base_control > $1/front_base.txt 
rostopic echo -b $1.bag -p /back_base_control > $1/back_base.txt  
rostopic echo -b $1.bag -p /motor_cmd_data > $1/motor_cmd.txt 
rostopic echo -b $1.bag -p /vector_output > $1/vector_output.txt 
