class RV8Pawn extends UTPawn;

simulated function SetCharacterClassFromInfo(class<UTFamilyInfo> Info)
{
	super.SetCharacterClassFromInfo(Info);
	
	Mesh.SetPhysicsAsset(PhysicsAsset'vincent_materials.scripts.SK_CH_Human_Physics', true);
	Mesh.AnimSets[0] = AnimSet'vincent_materials.scripts.K_AnimHuman_BaseMale';
}

simulated function SetCharacterMeshInfo(SkeletalMesh SkelMesh, MaterialInterface HeadMaterial, MaterialInterface BodyMaterial)
{

}

simulated function Scale(float NewScale, bool bDefaultScale)
{
	local float Factor, WeaponScale;
	local RV8TorchWeaponAttachment WA;
	local RV8TorchWeapon W;

	W = RV8TorchWeapon(Weapon);
	WA = RV8TorchWeaponAttachment(CurrentWeaponAttachment);

	Factor = NewScale/DrawScale;
	WeaponScale = bDefaultScale ? NewScale : 1/NewScale;

	BaseEyeHeight *= Factor;
	CylinderComponent.SetCylinderSize(CylinderComponent.CollisionRadius * Factor, CylinderComponent.CollisionHeight * Factor);
	W.TorchMesh.SetScale(WeaponScale);
	W.FireParticleComponent.SetScale(0.5 * WeaponScale);
	WA.Mesh.SetScale(WeaponScale);
	WA.FireParticleComponent.SetScale(0.5 * WeaponScale);
	SetDrawScale(NewScale);
}

defaultproperties
{
	Begin Object Name=WPawnSkeletalMeshComponent
		PhysicsAsset=PhysicsAsset'vincent_materials.scripts.SK_CH_Human_Physics'
		//AnimTreeTemplate=AnimTree'vincent_materials.scripts.AT_CH_Human'
		SkeletalMesh=SkeletalMesh'vincent_materials.scripts.SK_RV_Character'
	End Object
}

