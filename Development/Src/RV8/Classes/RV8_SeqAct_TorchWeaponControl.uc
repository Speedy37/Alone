class RV8_SeqAct_TorchWeaponControl extends SequenceAction;

event Activated()
{
	local RV8TorchWeapon Weapon;

	foreach GetWorldInfo().AllActors(class'RV8TorchWeapon', Weapon)
	{
		if(InputLinks[0].bHasImpulse)
		{
			Weapon.LightUp(); // LightUp
		}
		else if(InputLinks[1].bHasImpulse)
		{
			Weapon.LightDown(); // LightDown
		}
		else if(InputLinks[2].bHasImpulse)
		{
			Weapon.SimulateDropdown(); // Show
		}
		else if(InputLinks[3].bHasImpulse)
		{
			Weapon.SimulatePickup();
		}
	}
}

defaultproperties
{
	ObjName="Control Torch Weapon"
	ObjCategory="RV8"

    InputLinks(0)=(LinkDesc="LightUp")
    InputLinks(1)=(LinkDesc="LightDown")
    InputLinks(2)=(LinkDesc="SimulateDropdown")
    InputLinks(3)=(LinkDesc="SimulatePickup")

	VariableLinks.Empty
}
