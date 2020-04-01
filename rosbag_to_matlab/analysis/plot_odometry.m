% plot data of robot odometry  
function plot_odometry(odometry)
  
  t0 = odometry(1, 1);
  time_w = (odometry(:, 1) - t0) * 1e-9;
  
  figure; 
  hold on;
  plot(time_w, odometry(:, [2:3 7]));
  xlabel('time(s)');
  legend('x', 'y', 'yaw');
  title('pose')
  grid on;
end  