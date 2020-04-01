% plot the yaw estimation from camera and odometry, of the (both) robot
function plot_yaw(master, slave)
  
  is_slave_on = (nargin >= 2);
  t0 = master.wheel_odometry_data.time(1);
  
  figure;
  hold on;
  plot(master.wheel_odometry_data.time - t0, master.wheel_odometry_data.yaw, 'r-');
  plot(master.camera_data.time - t0, master.camera_data.qrcode_angle, 'r.');
  if is_slave_on
    plot(slave.wheel_odometry_data.time - t0, slave.wheel_odometry_data.yaw, 'm-');
    plot(slave.camera_data.time - t0, slave.camera_data.qrcode_angle, 'm.');
  end
  xlabel('time(s)');
  ylabel('yaw(rad)');
  grid on;
  
end
