function response = group_set_setpoint(group_number, torque_perc, rotor_current_perc)


request = {};

request.torque_setpoint = torque_perc;
request.stator_current_setpoint = rotor_current_perc;

% {"stator_current_setpoint":5, "torque_setpoint":0}


json_input_string = jsonencode(request);

response = write_to_middleware(group_number, json_input_string);



end