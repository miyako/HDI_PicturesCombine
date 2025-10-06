//%attributes = {"invisible":true}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	SET MENU BAR:C67(1)
	
	$Window:=Open form window:C675("Demo"; Plain window:K34:13; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("Demo"; *)
	
End if 