Param ([Parameter(Mandatory=$true,
                  ValueFromPipeline=$true,
                  ValueFromPipelineByPropertyName=$true)]$Object)
$ObjectTypeName = $Object.gettype().name
"Type of the Object = $ObjectTypeName"
$ObjectTypeFullName = $Object.GetType().fullname
"Full Name of Type = $ObjectTypeFullName "