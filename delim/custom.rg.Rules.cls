Class custom.rg.Rules Extends %RegisteredObject
{

/// Pass-in a delimited string.
ClassMethod parseDelimString(
	string As %String = "",
	childDelim As %String = "",
	parentDelim As %String = "|") As %ArrayOfDataTypes
{
	set (parentList, childList) = -1 // Note: $listvalid will validate an null string as a valid list.
	set (i, x, parentCount, childCount) = 0
	set (parent, child) = ""
	
	// Make sure we return an %ArrayOfDataTypes:
	set return = ##class(%ArrayOfDataTypes).%New()
	
	if ($length(string)) {
		
		set parentList = $listfromstring(string, parentDelim)
		
		if ($listvalid(parentList)) {
			
			set parentCount = $listlength(parentList)
			for i=1:1:parentCount {
				
				// Make sure the list has data:
				if ($listdata(parentList, i)) {
					
					set child = ##class(%ArrayOfDataTypes).%New()
					
					if ($length(childDelim)) {
						
						set childList = $listfromstring($list(parentList, i), childDelim)
						
						if ($listvalid(childList)) {
							
							set childCount = $listlength(childList)
							for x=1:1:childCount { // ControlVariable = StartValue:IncrementAmount:EndValue
								
								if ($listdata(childList, x)) {
									
									do child.SetAt($list(childList, x), x)
									
								}
								
							}
							
						}
						
					} else {
						
						do child.SetAt($list(parentList, i), i)
						
					}
					
					do return.SetAt(child, i)
					
				}
				
			}
			
		}
		
	}
	
	quit return
}

}
