function plot_stable_states(wo)
  figure;
  
  states_raw = wo.pitch;
  
  i_IMU = 0;
  i_encoders = 1;
  i_actuators = 2;
  i_IMU_ = 4;
  i_encoders_ = 5;
  i_actuators_ = 6;
  
  n_states = 6;
  
  states = [];
  for i = 1:length(states_raw)
    state = dec2bin(states_raw(i), 8);
    states = [states; [str2num(state(8-i_IMU)) str2num(state(8-i_encoders)) str2num(state(8-i_actuators)) str2num(state(8-i_IMU_)) str2num(state(8-i_encoders_)) str2num(state(8-i_actuators_))]];
  end
  
  states = states + repmat([n_states:-1:1]*2, length(states_raw), 1);
  
  plot(wo.time - wo.time(1), states);
  legend('IMU', 'encoders', 'actuators', 'IMU --', 'encoders --', 'actuators --');