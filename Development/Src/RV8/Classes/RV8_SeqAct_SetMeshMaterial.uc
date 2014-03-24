class RV8_SeqAct_SetMeshMaterial extends SequenceAction;


var() StaticMeshActor SMActor;

/** Material to apply to target when action is activated. */
var()	MaterialInterface	NewMaterial;

/** Index in the Materials array to replace with NewMaterial when this action is activated. */
var()	int					MaterialIndex;

event Activated()
{
	if(SMActor != none) 
	{
		SMActor.StaticMeshComponent.SetMaterial(MaterialIndex, NewMaterial);
	}
}

defaultproperties
{
	ObjName="Set Static Mesh Material"
	ObjCategory="Actor"

	VariableLinks.Empty
	VariableLinks.Add((ExpectedType=class'SeqVar_Object',LinkDesc="Static Mesh Actor",PropertyName=SMActor,MaxVars=1))
}
