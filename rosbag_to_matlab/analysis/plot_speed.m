% plot command speed and reference speed of robots
function plot_speed(master, slave)
  
  is_slave_on = (nargin >= 2);
  time = master.reference_robot_state.time(1);
  
  figure;
  hold on;
  plot(master.reference_robot_state.time - time, master.reference_robot_state.vx, 'b--',
       master.reference_robot_state.time - time, master.reference_robot_state.vy, 'g--', 
       master.reference_robot_state.time - time, master.reference_robot_state.wz, 'r--');
  plot(master.output_robot_state.time - time, master.output_robot_state.vx, 'b-',
       master.output_robot_state.time - time, master.output_robot_state.vy, 'g-',
       master.output_robot_state.time - time, master.output_robot_state.wz, 'r-');
  if is_slave_on
    plot(slave.reference_robot_state.time - time, slave.reference_robot_state.vx, 'b-.',
         slave.reference_robot_state.time - time, slave.reference_robot_state.vy, 'g-.',
         slave.reference_robot_state.time - time, slave.reference_robot_state.wz, 'r-.');
    plot(slave.output_robot_state.time - time, slave.output_robot_state.vx, 'b:',
         slave.output_robot_state.time - time, slave.output_robot_state.vy, 'g:',
         slave.output_robot_state.time - time, slave.output_robot_state.wz, 'r:');
  end
  xlabel('time(s)');
  title('robot speed');
  grid on;