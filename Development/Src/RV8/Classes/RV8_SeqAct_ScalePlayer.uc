class RV8_SeqAct_ScalePlayer extends SequenceAction;

var() float NewScale;
var() bool DefaultScale;

event Activated()
{
	local PlayerController PC;

	foreach GetWorldInfo().LocalPlayerControllers(class'PlayerController', PC)
	{
		if(PC.Pawn != none)
		{
			RV8Pawn(PC.Pawn).Scale(NewScale, DefaultScale);
		}
	}
}

defaultproperties
{
	ObjName="Control Player Scale"
	ObjCategory="RV8"

	VariableLinks.Empty
	VariableLinks.Add((ExpectedType=class'SeqVar_Float',LinkDesc="New Scale",PropertyName=NewScale,MaxVars=1))
	VariableLinks.Add((ExpectedType=class'SeqVar_Bool',LinkDesc="Is Default",PropertyName=DefaultScale,MaxVars=1))
}

