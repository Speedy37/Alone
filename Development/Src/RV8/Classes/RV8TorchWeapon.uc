class RV8TorchWeapon extends UTWeapon;

var SkeletalMeshComponent TorchMesh;
var ParticleSystemComponent FireParticleComponent;
var bool bActivated;

simulated function PostBeginPlay()
{
	local SkeletalMeshComponent SKMesh;

	Super.PostBeginPlay();
	
	SKMesh = SkeletalMeshComponent(Mesh);
	SKMesh.AttachComponentToSocket(TorchMesh, 'Weapon');

	FireParticleComponent = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(ParticleSystem'vincent_materials.scripts.P_UDK_TorchFire01', TorchMesh, 'Fire', true);
	FireParticleComponent.SetDepthPriorityGroup(SDPG_Foreground);
	FireParticleComponent.SetScale(0.5);
	bActivated = true;
}

simulated function SimulatePickup()
{

}

simulated function SimulateDropdown()
{

}

simulated function RV8TorchWeaponAttachment GetAttachment()
{
	return RV8TorchWeaponAttachment(RV8Pawn(Instigator).CurrentWeaponAttachment);
}
simulated function LightDown()
{
	if(bActivated)
	{
		FireParticleComponent.DeactivateSystem();
		FireParticleComponent = none;
		Mesh.SetMaterial(7, MaterialInstanceConstant'vincent_materials.scripts.M_UDK_Torch_MASTER_INST_OFF');
		bActivated = false;
		GetAttachment().LightDown();
	}
}

simulated function LightUp()
{
	if(!bActivated)
	{
		FireParticleComponent = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(ParticleSystem'vincent_materials.scripts.P_UDK_TorchFire01', SkeletalMeshComponent(Mesh), 'Fire', true);
		FireParticleComponent.SetScale(0.5);
		Mesh.SetMaterial(7, MaterialInstanceConstant'vincent_materials.scripts.M_UDK_Torch_MASTER_INST');
		GetAttachment().LightUp();
		bActivated = true;
	}
}

defaultproperties
{
	PlayerViewOffset=(X=10.000000,Y=10.000000,Z=-90.000000)
	AttachmentClass=class'RV8TorchWeaponAttachment'

	// Weapon SkeletalMesh
	Begin Object class=AnimNodeSequence Name=MeshSequenceA
	End Object

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'vincent_materials.scripts.SK_RV_Torch'
		AnimSets(0)=AnimSet'vincent_materials.scripts.K_RV_Torch'
		Animations=MeshSequenceA
	End Object

	Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'vincent_materials.scripts.SK_RV_Torch_3rd'
	End Object
	TorchMesh=SkeletalMeshComponent0

	WeaponColor=(R=255,G=255,B=128,A=255)
	FireInterval(0)=+1.0
	FireInterval(1)=+1.0
	ShotCost(0)=0
	ShotCost(1)=0
	InstantHitDamage(0)=10.0
	FireCameraAnim(0)=CameraAnim'vincent_materials.scripts.C_RV_TorchFireShake'
	WeaponFireAnim(0)=Fire2
	WeaponIdleAnims(0)=Idle
	PlayerViewOffset=(X=0.0,Y=7.0,Z=-9.0)

	WeaponFireTypes(0)=EWFT_InstantHit
	WeaponFireTypes(1)=EWFT_Custom

	FireOffset=(X=16,Y=10)

	AIRating=+0.75
	CurrentRating=+0.75
	bInstantHit=false
	bSplashJump=false
	bRecommendSplashDamage=false
	bSniping=false
	ShouldFireOnRelease(0)=0
	ShouldFireOnRelease(1)=0
	bCanThrow=false

	InventoryGroup=1
	GroupWeight=0.5

	AmmoCount=99
	LockerAmmoCount=99
	MaxAmmoCount=99

	bExportMenuData=false
}
