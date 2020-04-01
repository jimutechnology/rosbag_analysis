# Give master, slave
# Get master0, slave0
master0 = [];
slave0 = [];
link_info = master.robots_link_status;
master0.x = getfield(link_info, 'master_robot.pose.x');
master0.y = getfield(link_info, 'master_robot.pose.y');
master0.yaw = getfield(link_info, 'master_robot.pose.theta');
slave0.x = getfield(link_info, 'slave_robot.pose.x');
slave0.y = getfield(link_info, 'slave_robot.pose.y');
slave0.yaw = getfield(link_info, 'slave_robot.pose.theta');