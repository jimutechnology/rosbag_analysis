% string starts with invalid substring 'data:'
function raws = decode_odometer_raw(string)
  str = strsplit(string);
  
  nums_hex = [];
  for i_num = 1:6
    num_hex = [];
    for i_sub = 1:4
      temp = str{3 + i_sub + (i_num-1)*4};
      if length(temp) == 1
        temp = ['0' temp];
      end
      num_hex = [temp num_hex];
    end
    nums_hex(i_num) = typecast(uint32(hex2dec(num_hex)), 'single') / 180.0 * pi;
  end
  
  raws = nums_hex;
  
display(['yaw: ' num2str(raws(1)) ', roll: ' num2str(raws(2)) ', pitch: ' num2str(raws(3)) ', X: ' num2str(raws(4)*0.18/pi) ', Y: ' num2str(raws(5)*0.18/pi) ' w: ' num2str(raws(6))]);