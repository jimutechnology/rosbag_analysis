function plot_motors(master, slave)

  t0 = master.motor_cmd_data.time(1);
  is_slave_on = (nargin >= 2);
 
  figure; 
  hold on;
  plot(master.motor_cmd_data.time - t0, master.motor_cmd_data.speed, '-');
  if is_slave_on
    plot(slave.motor_cmd_data.time - t0, slave.motor_cmd_data.speed, '--');
  end
  
  title('motor speeds');
  xlabel('time(s)');
  ylabel('count');
  grid on;
  

end