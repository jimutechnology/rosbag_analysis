% plot data of bases
% This is for dual diff wheel robot only
function plot_base(master)
  
  figure;
  hold on;
  
  t0 = master.front_base_control.time(1);
  
  plot(master.front_base_control.time - t0, master.front_base_control.angle_ref, 'b--',
       master.front_base_control.time - t0, master.front_base_control.angle,     'b-',
       master.front_base_control.time - t0, master.front_base_control.cmd_v,     'b-.',
       master.front_base_control.time - t0, master.front_base_control.cmd_w,     'b:');
  plot(master.back_base_control.time - t0,  master.back_base_control.angle_ref,  'g--',
       master.back_base_control.time - t0,  master.back_base_control.angle,      'g-',
       master.back_base_control.time - t0,  master.back_base_control.cmd_v,      'g-.',
       master.back_base_control.time - t0,  master.back_base_control.cmd_w,      'g:');

  legend('angle^{ref}', 'angle', 'v^{ref}', '\omega^{ref}');
  xlabel('time(s)');
  grid on;
  
end

  
  