function json_output = write_to_middleware(group_number, json_input_string)
% Utility function to write a json packet to the drive's middleware.

if nargin == 0
    group_number = 1;
    json_input_string = '{"stator_current_setpoint":5, "torque_setpoint":5}';
end

HOST = "0.0.0.0";

PORT = 1230 + group_number;
I_MAX = 50;

%json_input_string = sprintf('[%s]', json_input_string);


t = tcpclient(HOST, PORT);
write(t, json_input_string);

% Read data from TCP/IP socket
i = 0;
while 1
    if t.NumBytesAvailable > 0
        break
    end
    pause(0.04)
    i = i + 1;
    if i >= I_MAX
        error('Received nothing from the socket for some time. Quitting.');
        
    end
end

data = read(t,t.NumBytesAvailable, "string");
clear t; % Close socket connection


json_output = jsondecode(data);


end