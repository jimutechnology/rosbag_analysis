% master, slave: data package of two robots
% master0, slave0: {x, y, yaw} of the two robots at the beginning (linking)
function plot_robot_pair(master, slave, master0, slave0)
  % calculate transformation
  xs_m_i = slave0.x - master0.x;
  ys_m_i = slave0.y - master0.y;
  yawm_i = master0.yaw;
  yaws_m = slave0.yaw - master0.yaw;
  xs_m = xs_m_i * cos(yawm_i) + ys_m_i * sin(yawm_i);
  ys_m = xs_m_i * sin(-yawm_i)+ ys_m_i * cos(yawm_i);
  
  x_s = slave.wheel_odometry_data.x;
  y_s = slave.wheel_odometry_data.y;
  yaw_s = slave.wheel_odometry_data.yaw;
  yaw_m = master.wheel_odometry_data.yaw;
  x_s_m = master.wheel_odometry_data.x + xs_m * cos(yaw_m) - ys_m * sin(yaw_m);
  y_s_m = master.wheel_odometry_data.y + xs_m * sin(yaw_m) + ys_m * cos(yaw_m);
  yaw_s_m = master.wheel_odometry_data.yaw + yaws_m;
  
  t0 = master.wheel_odometry_data.time(1);
  
  figure;
  hold on;
  plot(slave.wheel_odometry_data.time - t0, [x_s y_s yaw_s], '-');
  plot(master.wheel_odometry_data.time - t0, [x_s_m y_s_m yaw_s_m], '--');
  legend('slave x', 'slave y', 'slave yaw', 'reference x', 'reference y', 'reference yaw');
  xlabel('time(s)');
  
  

  