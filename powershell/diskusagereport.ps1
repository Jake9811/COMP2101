gwmi -class win32_logicaldisk | 
where size -gt 0 | 
ft DeviceID, 
@{n="Size(GB)"; e={$_.size/1gb -as [int]}},
@{n="Free(GB)"; e={$_.freespace/1gb -as [int]}},
ProviderName