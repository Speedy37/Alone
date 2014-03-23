class RV8TorchWeapon extends UTWeapon;

var ParticleSystemComponent FireParticleComponent;
var LightComponent FireLightComponent;
var AudioComponent FireSound;

simulated function PostBeginPlay()
{
	local SkeletalMeshComponent SKMesh;

	Super.PostBeginPlay();
	
	SKMesh = SkeletalMeshComponent(Mesh);

	FireParticleComponent = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(ParticleSystem'vincent_materials.scripts.P_UDK_TorchFire01', SKMesh, 'Fire', true);
	FireParticleComponent.SetScale(0.5);

	SKMesh.AttachComponentToSocket(FireLightComponent, 'Fire');
	SKMesh.AttachComponentToSocket(FireSound, 'Fire');
}

defaultproperties
{
	PlayerViewOffset=(X=10.000000,Y=10.000000,Z=-90.000000)

	// Weapon SkeletalMesh
	Begin Object class=AnimNodeSequence Name=MeshSequenceA
	End Object

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'vincent_materials.scripts.SK_RV_Torch'
		//AnimSets(0)=AnimSet'WP_ShockRifle.Anim.K_WP_ShockRifle_1P_Base'
		Animations=MeshSequenceA
	End Object

	Begin Object Class=PointLightComponent Name=PointLightComponent0
	    LightAffectsClassification=LAC_DYNAMIC_AFFECTING
		CastShadows=TRUE
		CastStaticShadows=TRUE
		CastDynamicShadows=FALSE
		bForceDynamicLight=true
		UseDirectLightMap=FALSE
		LightingChannels=(Dynamic=TRUE)
		Brightness=12
		LightColor=(B=110,G=170,R=255,A=0)
		Radius=256
		FalloffExponent=8.0
	End Object
	FireLightComponent = PointLightComponent0

	Begin Object Class=AudioComponent Name=AudioComponent0
		bAutoPlay=true
		VolumeMultiplier=0.5
		SoundCue=SoundCue'A_Vehicle_Generic.Fire.VehicleDerbisLoop_Cue'
	End Object
	FireSound=AudioComponent0

	HoldDistanceMin=0.0
	HoldDistanceMax=750.0
	WeaponImpulse=2000.0
	ThrowImpulse=100.0
	ChangeHoldDistanceIncrement=50.0

	WeaponColor=(R=255,G=255,B=128,A=255)
	FireInterval(0)=+1.0
	FireInterval(1)=+1.0
	ShotCost(0)=0
	ShotCost(1)=0
	PlayerViewOffset=(X=0.0,Y=7.0,Z=-9.0)

	WeaponFireTypes(0)=EWFT_Custom
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
