Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_PICTURE:C286(<>Pict1; <>Pict2; <>Pict3)
		
		READ PICTURE FILE:C678(File:C1566("/RESOURCES/Images/library/Caledonie.jpg").platformPath; <>Pict1)
		READ PICTURE FILE:C678(File:C1566("/RESOURCES/Images/library/Flêche.png").platformPath; <>Pict2)
		
		<>SliderH:=20
		<>SliderV:=80
		
		COMBINE PICTURES:C987(<>Pict3; <>Pict1; Superimposition:K61:10; <>Pict2; <>SliderH; 100-<>SliderV)
		
End case 