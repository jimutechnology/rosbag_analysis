% plot data of robot reference/output/odometry  
function plot_body(master, slave)

  is_slave_on = (nargin >= 2);
  
  time = master.reference_robot_state.time(1);
  
  figure;
  hold on;
  plot(master.reference_robot_state.time - time, master.reference_robot_state.x, 'b--',
       master.reference_robot_state.time - time, master.reference_robot_state.y, 'g--', 
       master.reference_robot_state.time - time, fmod(master.reference_robot_state.yaw, pi*2), 'r--');
  plot(master.wheel_odometry_data.time - time, master.wheel_odometry_data.x, 'b-',
       master.wheel_odometry_data.time - time, master.wheel_odometry_data.y, 'g-',
       master.wheel_odometry_data.time - time, fmod(master.wheel_odometry_data.yaw, pi*2), 'r-');
  if is_slave_on
    plot(slave.reference_robot_state.time - time, slave.reference_robot_state.x, 'b-.',
         slave.reference_robot_state.time - time, slave.reference_robot_state.y, 'g-.',
         slave.reference_robot_state.time - time, fmod(slave.reference_robot_state.yaw, pi*2), 'r-.');
    plot(slave.wheel_odometry_data.time - time, slave.wheel_odometry_data.x, 'b:',
         slave.wheel_odometry_data.time - time, slave.wheel_odometry_data.y, 'g:',
         slave.wheel_odometry_data.time - time, fmod(slave.wheel_odometry_data.yaw, pi*2), 'r:');
  end
  xlabel('time(s)');
  title('robot pose');
  legend('x', 'y', 'yaw');
  grid on;
    

end  