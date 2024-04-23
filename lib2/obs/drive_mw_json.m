function obj = drive_mw_json(group_n, mode, torque_setpoint, stator_current_setpoint, current_time)
% Create a JSON object with the content necessary to talk with the group
% drive.

obj = {};

obj.group = group_n;
obj.mode = mode;

if nargin >= 3 && ~isnan(torque_setpoint)
    obj.torque_setpoint = torque_setpoint;
end

if nargin >= 4 && ~isnan(stator_current_setpoint)
    obj.stator_current_setpoint = stator_current_setpoint;
end

if nargin >= 5 && ~isnan(current_time)
    obj.current_time = current_time;
end




end