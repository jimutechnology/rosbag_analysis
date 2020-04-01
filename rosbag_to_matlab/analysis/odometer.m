function yaw = odometer(string)
  str = strsplit(string);
  
  yaw_hex = [];
  for i = 1:4
    temp = str{3 + i};
    if length(temp) == 1
      temp = ['0' temp];
    end
    yaw_hex = [temp yaw_hex];
  end
  
  % hex to ieee float
  yaw = typecast(uint32(hex2dec(yaw_hex)),'single') / 180.0 * pi;