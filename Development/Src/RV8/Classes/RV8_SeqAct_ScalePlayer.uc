class RV8_SeqAct_ScalePlayer extends SequenceAction;

var() float NewScale;

event Activated()
{
	local PlayerController PC;

	foreach GetWorldInfo().LocalPlayerControllers(class'PlayerController', PC)
	{
		if(PC.Pawn != none)
		{
			PC.Pawn.SetDrawScale(NewScale);
		}
	}
}

defaultproperties
{
	ObjName="Control Player Scale"
	ObjCategory="RV8"

	VariableLinks.Empty
	VariableLinks.Add((ExpectedType=class'SeqVar_Float',LinkDesc="New Scale",PropertyName=NewScale,MaxVars=1))
}

