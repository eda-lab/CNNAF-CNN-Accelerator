set usb [lindex [get_hardware_names] 0]
set device_name [lindex [get_device_names -hardware_name $usb] 0]

proc start {} {
    global device_name usb
    start_insystem_source_probe -device_name $device_name -hardware_name $usb
    
    write_source_data -instance_index 0 -value "011"
    
    end_insystem_source_probe
}

proc chg_mem {file} {
    global device_name usb
    
    begin_memory_edit -hardware_name $usb -device_name $device_name

    update_content_to_memory_from_file -instance_index 0 -mem_file_path $file -mem_file_type mif -timeout 60000

    end_memory_edit 
}

proc read_probe {} {
    global device_name usb
    
    start_insystem_source_probe -device_name $device_name -hardware_name $usb

    set rd_data [read_probe_data -instance_index 0]

    end_insystem_source_probe
}

proc write_source {value} {
    global device_name usb

    start_insystem_source_probe -device_name $device_name -hardware_name $usb

    write_source_data -instance_index 0 -value $value

    end_insystem_source_probe
}

