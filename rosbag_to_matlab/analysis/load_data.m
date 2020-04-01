time = []; % all time from each dataset

if exist('motor_cmd.txt')
  data = load('motor_cmd.txt');
  motor_cmd.time = data(:, 1) * 1e-9;
  motor_cmd.motors = data(:, 2:5) / 1200000.0;
  time = [time; motor_cmd.time];
end

if exist('front_base.txt')
  data = load('front_base.txt');
  front_base.time = data(:, 1) * 1e-9;
  front_base.angle_ref = data(:, 2);
  front_base.angle = data(:, 3);
  front_base.cmd_v = data(:, 4);
  front_base.cmd_w = data(:, 5);
end

if exist('back_base.txt')
  data = load('back_base.txt');
  back_base.time = data(:, 1) * 1e-9;
  back_base.angle_ref = data(:, 2);
  back_base.angle = data(:, 3);
  back_base.cmd_v = data(:, 4);
  back_base.cmd_w = data(:, 5);
end

if exist('speed_cmd.txt')
  data = load('speed_cmd.txt');
  speed_cmd.time = data(:, 1) * 1e-9;
  speed_cmd.vx = data(:, 4);
  speed_cmd.vy = data(:, 5);
  speed_cmd.wz = data(:, 6);
end

if exist('vector_output.txt')
  data = load('vector_output.txt');
  debug.time = data(:, 1) * 1e-9;
  debug.state = data(:, 3);
  debug.state_motion = data(:, 4);
  debug.state_manual = data(:, 5);
end

if exist('reference_state.txt')
  data = load('reference_state.txt');
  reference.time = data(:, 1) * 1e-9;
  reference.x = data(:, 2);
  reference.y = data(:, 3);
  reference.yaw = data(:, 4);
  reference.vx = data(:, 5);
  reference.vy = data(:, 6);
  reference.wz = data(:, 7);
end

if exist('output_state.txt')
  data = load('output_state.txt');
  output.time = data(:, 1) * 1e-9;
  output.vx = data(:, 5);
  output.vy = data(:, 6);
  output.wz = data(:, 7);
end

if exist('odometry.txt')
  data = load('odometry.txt');
  state.time = data(:, 1) * 1e-9;
  state.x = data(:, 2);
  state.y = data(:, 3);
  state.yaw = data(:, 7);
end

  
t0 = min(min(time));

if exist('motor_cmd.txt')
  motor_cmd.time = motor_cmd.time - t0;
end  
if exist('front_base.txt')
  front_base.time = front_base.time - t0;
end
if exist('back_base.txt')
  back_base.time = back_base.time - t0;
end
if exist('speed_cmd.txt')
  speed_cmd.time = speed_cmd.time - t0;
end
if exist('vector_output.txt')
  debug.time = debug.time - t0;
end
if exist('reference')
  reference.time = reference.time - t0;
end
if exist('output')
  output.time = output.time - t0;
end
if exist('state')
  state.time = state.time - t0;
end


%load reference_state.txt
%load output_state.txt
%load odometry.txt
%load front_base.txt
%load back_base.txt
%load motor_cmd.txt
%load vector_output.txt
%load speed_cmd.txt