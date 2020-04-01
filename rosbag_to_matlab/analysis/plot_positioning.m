function plot_positioning(master)
  
  figure;
  hold on;
  
  t0 = master.wheel_odometry_data.time(1);
  
  plot(master.wheel_odometry_data.time - t0, master.wheel_odometry_data.x_raw,  'b-',
       master.wheel_odometry_data.time - t0, master.wheel_odometry_data.y_raw,  'g-',
       master.wheel_odometry_data.time - t0, master.wheel_odometry_data.yaw_raw, 'r-');
  plot(master.camera_data.time - t0,  master.camera_data.qrcode_dx,  'b.',
       master.camera_data.time - t0,  master.camera_data.qrcode_dy,  'g.',
       master.camera_data.time - t0,  master.camera_data.qrcode_angle + pi, 'r.');

  legend('odometer_x', 'odometer_y', 'odometer_{yaw}', 'camera_x', 'camera_y', 'camera_{yaw}');
  xlabel('time(s)');
  grid on;
  
end