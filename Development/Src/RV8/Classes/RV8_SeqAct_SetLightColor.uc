class RV8_SeqAct_SetLightColor extends SequenceAction;

var() Light LightActor;
var() Color	NewLightColor;

event Activated()
{
	if(LightActor != none) 
	{
		LightActor.LightComponent.SetLightProperties(, NewLightColor);
	}
}

defaultproperties
{
	ObjName="Set Light Color"
	ObjCategory="Actor"

	VariableLinks.Empty
	VariableLinks.Add((ExpectedType=class'SeqVar_Object',LinkDesc="Light Actor",PropertyName=LightActor,MaxVars=1))
}
