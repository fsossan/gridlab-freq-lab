function output = group_comm(args)

% encode to json and write to tcp/ip
% {"group":1,"torque_setpoint":10}

% to test:
% client: nc localhost 5555
% server: nc -lk localhost 5555

if nargin == 0
    group = 1;
    torque_setpoint = 3;
    args = [group, torque_setpoint];
end

% Retrieve input data from argument list
group = args(1);
torque_setpoint = args(2);


if group == 0
    output = [0];
    return
end
response = group_set_setpoint(group, torque_setpoint, 45);
%response = response(1);

frequency_from_rpm = response.speed/60 * 2;
frequency = response.frequency;

if frequency_from_rpm < 47 || frequency_from_rpm > 53
    % Taking the frequency from the rpm and not the power meter because the
    % latter is not accurate.
    frequency = frequency_from_rpm;
end


% Assign ouput
output = [];
% Frequency
output(1) = frequency;


end