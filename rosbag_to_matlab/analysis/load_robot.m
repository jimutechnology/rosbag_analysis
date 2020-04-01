% Load data of robot, from folder /filename
% Input:
%   - filename: filename as well as the folder name of the data, e.g. the rosbag to read is /filename/filename.bag
%
function robot = load_robot(filename)
  
  robot = {};
  foldername = filename;
  
  % load all related .mat files
  files = dir([filename '/' filename '__' '*' '.mat']);
  for i = 1:length(files)
    % - Get NAME
    ind_name_start = length(filename) + 3; % consider __
    ind_name_end = length(files(i).name) - 4; % remove '.mat'
    name = files(i).name(ind_name_start:ind_name_end);
    
    % skip these topics
    if strcmp(name, "rosout") || strcmp(name, "rosout_agg") || strcmp(name, "scan") || strcmp(name, "filtered_scan")
      continue;
    end
      
    % - Get DATA
    data = struct();
    input = load([foldername '/' files(i).name]);

    % -- Get time
    data.time = input.time;
    % -- Get sub data
    for i_data = 1:numel(input.data, 1, ':')
%      data = setfield(data, input.header(i_data, :), input.data(:, i_data));
      sub_name = input.header(i_data, :);
      sub_name = sub_name(~isspace(sub_name)); % remove spaces
      data.(sub_name) = input.data(:, i_data);
    end
    
    % - add new data to the object robot
    robot.(name) = data;
    
  end
  
  
  % shape the data
  if exist('robot') == 1
    if isfield(robot, 'motor_cmd_data')
      speed = [getfield(robot.motor_cmd_data, 'speed.0') getfield(robot.motor_cmd_data, 'speed.1') getfield(robot.motor_cmd_data, 'speed.2') getfield(robot.motor_cmd_data, 'speed.3')];
      time = robot.motor_cmd_data.time;
      robot.motor_cmd_data = [];
      robot.motor_cmd_data.time = time;
      robot.motor_cmd_data.speed = speed;
    end
    
  end
  
end

  
  