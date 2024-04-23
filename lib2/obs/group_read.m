function response = group_read(group_number)

request = drive_mw_json(group_number, 2);
response = write_to_middleware(request);


end