class RV8Pawn extends UTPawn;

var float CurrentDefaultScale;

simulated function SetCharacterClassFromInfo(class<UTFamilyInfo> Info)
{
	super.SetCharacterClassFromInfo(Info);
	
	Mesh.SetPhysicsAsset(PhysicsAsset'vincent_materials.scripts.SK_CH_Human_Physics', true);
	Mesh.AnimSets[0] = AnimSet'vincent_materials.scripts.K_AnimHuman_BaseMale';
}

simulated function SetCharacterMeshInfo(SkeletalMesh SkelMesh, MaterialInterface HeadMaterial, MaterialInterface BodyMaterial)
{

}

simulated function TakeFallingDamage()
{

}

simulated function SetBaseEyeheight()
{
	if ( !bIsCrouched )
		BaseEyeheight = DrawScale * Default.BaseEyeheight;
	else
		BaseEyeheight = FMin(0.8 * CrouchHeight, CrouchHeight - 10);
}

simulated function Scale(float NewScale, bool bDefaultScale)
{
	local float Factor, WeaponScale;
	local RV8TorchWeaponAttachment WA;
	local RV8TorchWeapon W;

	W = RV8TorchWeapon(Weapon);
	WA = RV8TorchWeaponAttachment(CurrentWeaponAttachment);

	if(bDefaultScale)
		CurrentDefaultScale = NewScale;
	Factor = NewScale/DrawScale;
	WeaponScale = bDefaultScale ? 1.0 : CurrentDefaultScale/NewScale;

	CustomGravityScaling = NewScale;
	BaseEyeHeight *= Factor;
	GroundSpeed *= Factor;
	AirSpeed *= Factor;
	WalkingPct*= Factor;
	CrouchedPct*= Factor;
	BaseEyeHeight*= Factor;
	EyeHeight *= Factor;
	AccelRate *= Factor;
	JumpZ *= Factor;
	CrouchHeight *= Factor;
	CrouchRadius *= Factor;

	CylinderComponent.SetCylinderSize(CylinderComponent.CollisionRadius * Factor, CylinderComponent.CollisionHeight * Factor);
	W.TorchMesh.SetScale(WeaponScale);
	W.FireParticleComponent.SetScale(0.5 * WeaponScale);
	WA.Mesh.SetScale(WeaponScale);
	WA.FireParticleComponent.SetScale(0.5 * WeaponScale);
	if(bDefaultScale)
		WA.FireLightComponent.Radius = 256 * NewScale;
	SetDrawScale(NewScale);
}

defaultproperties
{
	MovementSpeedModifier=0.75;
	CurrentDefaultScale=1.0
	bCanCrouch=false
	bCanStrafe=false
	bCanDoubleJump=false
	GroundSpeed=330.0
	AirSpeed=220.0
	Begin Object Name=WPawnSkeletalMeshComponent
		PhysicsAsset=PhysicsAsset'vincent_materials.scripts.SK_CH_Human_Physics'
		//AnimTreeTemplate=AnimTree'vincent_materials.scripts.AT_CH_Human'
		SkeletalMesh=SkeletalMesh'vincent_materials.scripts.SK_RV_Character'
	End Object
}

