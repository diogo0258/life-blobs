; http://abstrusegoose.com/51
; The gui shows the months of one's life in visual form. The months 
; that are gone are marked with an 'X', the future ones are 'blobs', 
; and if you're seeing some 'check marks', congrats on the long life.

#NoEnv

FontName := "Marlett"
FontSize := 12

SGone := "r"
SYetToGo := "n"
SStillGoing := "a"


; Gui, 1:Default
Gui, Add, GroupBox, x16 y12 w100 h70 +Center, Birthday
Gui, Add, Text, x26 y32 w30 h20 +Center, MM
Gui, Add, Text, x66 y32 w40 h20 +Center, YYYY
Gui, Add, Edit, x26 y52 w30 h20 vBirthM Limit2 +Center
Gui, Add, Edit, x66 y52 w40 h20 vBirthY Limit4 +Center
Gui, Add, GroupBox, x16 y92 w100 h50 +Center, Life expectancy
Gui, Add, Edit, x36 y112 w30 h20 vExpectancy Number +Center, 78 ; approx. life expectancy in the US according to Wikipedia
Gui, Add, Text, x71 y114 w30 h20 , years
Gui, Add, Text, x36 y152 w60 h20 +Center, Columns
Gui, Add, Edit, x46 y172 w40 h20 vColumns Number +Center, 36
Gui, Add, Button, x16 y207 w45 h25 Default , OK
Gui, Add, Button, x71 y207 w45 h25 , Cancel
; Generated using SmartGUI Creator 4.0
Gui, Show, h249 w132, Life Blobs

return



ButtonOK:
Gui, Submit

Gone := (A_Year - BirthY)*12 + A_Mon - BirthM
Expectancy *= 12

Str := ""

i := 1
Loop, % Gone
{
	if (i > Columns)
	{
		Str .= "`n"
		i := 1
	}
	
	Str .= A_Index > Expectancy ? SStillGoing : SGone
	i++
}

Loop, % Gone > 0 ? Expectancy - Gone : Expectancy
{
	if (i > Columns)
	{
		Str .= "`n"
		i := 1
	}
	
	Str .= SYetToGo
	i++	
}


Gui 2:Default
Gui, -Caption
Gui, Font, s%FontSize%, %FontName%
Gui, Add, Text,, % Str
Gui, Show

return


GuiClose:
GuiEscape:
ButtonCancel:
2GuiClose:
2GuiEscape:
ExitApp