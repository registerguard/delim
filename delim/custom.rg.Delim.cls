/// custom.rg.Delim
/// See <code>custom.rg.Delim.csr</code> for related code.
///
/// @docs https://github.com/registerguard/delim
/// @copyright Copyright (c) 2013 Micky Hulse/The Register-Guard.
/// @license Released under the Apache License, Version 2.0.
/// http://www.apache.org/licenses/LICENSE-2.0
/// @version 2.0.0
/// @created Thursday, February 5, 2009
/// @modified Wednesday, June 26, 2013
Class custom.rg.Delim Extends %RegisteredObject
{

/// @param string { %String } String to parse (required).
/// @param child { %String } Child delimiter.
/// @param parent { %String } Parent delimiter.
/// @return { %ArrayOfDataTypes } Parsed string as iterable objects.
ClassMethod parse(
	string As %String = "",
	parentDelim As %String = "|",
	childDelim As %String = "") As %ArrayOfDataTypes
{
	
	; Declare and initialize:
	set (parentList, childList) = -1 // Note: $listvalid will validate an null string as a valid list.
	set (i, x, parentCount, childCount) = 0
	set (parent, child) = ""
	set return = ##class(%ArrayOfDataTypes).%New()
	
	; Check required arguments:
	if ($length(string)) {
		
		; Convert delimited parent string into a $list:
		set parentList = ..lister(string, parentDelim)
		
		; Validate our parent $list:
		if ($listvalid(parentList)) {
			
			; Count our parents:
			set parentCount = $listlength(parentList)
			
			; At least one?
			for i=1:1:parentCount { // ControlVariable = StartValue:IncrementAmount:EndValue
				
				; Ok, so make sure the list has data:
				if ($listdata(parentList, i)) {
					
					; Initialize:
					set child = ##class(%ArrayOfDataTypes).%New()
					
					; Is there a child delimiter?
					if ($length(childDelim)) {
						
						; Convert delimited child string into a $list:
						set childList = ..lister($list(parentList, i), childDelim)
						
						; Validate our child $list:
						if ($listvalid(childList)) {
							
							; Count our children:
							set childCount = $listlength(childList)
							
							; At least one?
							for x=1:1:childCount {
								
								; Ok, so make sure the list has data:
								if ($listdata(childList, x)) {
									
									; Add item to master list:
									do child.SetAt($list(childList, x), x)
									
								}
								
							}
							
						}
						
					} else {
						
						; Add item to master list:
						do child.SetAt($list(parentList, i), i)
						
					}
					
					; Add item to master list:
					do return.SetAt(child, i)
					
				}
				
			}
			
		}
		
	}
	
	; Return the %ArrayOfDataTypes:
	quit return
	
}

/// Trims white space and builds a list.
/// 
/// set items = ..lister("foo, bar, baz", ",") // "items" is now a list.
///
/// @see https://groups.google.com/d/topic/intersystems-public-cache/8iJV1p3kwD8/discussion
/// @see https://gist.github.com/4008569
///
/// @param list { string } Required. Comma delimited list.
/// @param delim { string } Required. Delimiter that separates list items.
/// @private
ClassMethod lister(
	string As %String = "",
	delim As %String = "") As %List [ Private ]
{
	
	; Declare & initialze:
	set (return, temp) = ""
	
	; Check required arguments:
	if ($length(string) && $length(delim)) {
		
		; Loop over string using provided delimiter:
		for i=1:1:$length(string, delim) {
			
			; Grab current item and trim the whitespace:
			set temp = $zstrip($piece(string, delim, i), "<>W")
			
			; If there's something left over, add it to the return value:
			set:($length(temp)) return = return _ $listbuild(temp)
			
		}
		
	}
	
	; Return the $list:
	quit return
	
}

}
