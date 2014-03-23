class RV8Game extends UTDeathmatch;

function AddDefaultInventory( pawn PlayerPawn )
{
	PlayerPawn.CreateInventory(class'RV8TorchWeapon',false);
	PlayerPawn.AddDefaultInventory();
}

defaultproperties
{
	PlayerControllerClass=class'RV8PlayerController'
	DefaultPawnClass=class'RV8Pawn'
}
