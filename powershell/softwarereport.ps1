gwmi -class win32_product -filter "vendor!='Microsoft Corporation'" | 
sort InstallDate | 
ft Name,Vendor,Version,InstallDate