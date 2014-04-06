class RV8TorchWeaponAttachment extends UTWeaponAttachment;

var ParticleSystemComponent FireParticleComponent;
var PointLightComponent FireLightComponent;
var AudioComponent FireSound;

simulated function AttachTo(UTPawn OwnerPawn)
{
	super.AttachTo(OwnerPawn);

	FireParticleComponent = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(ParticleSystem'vincent_materials.scripts.P_UDK_TorchFire01', Mesh, 'Fire', true);
	FireParticleComponent.SetScale(0.5);

	Mesh.AttachComponentToSocket(FireLightComponent, 'Fire');
	Mesh.AttachComponentToSocket(FireSound, 'Fire');
	FireSound.Play();
}

simulated function DetachFrom( SkeletalMeshComponent MeshCpnt )
{
	super.DetachFrom(MeshCpnt);
}

simulated function SimulatePickup()
{
	SetHidden(false);
	FireSound.Play();
	FireLightComponent.SetEnabled(true);
}

simulated function SimulateDropdown()
{
	SetHidden(true);
	FireSound.Stop();
	FireLightComponent.SetEnabled(false);
}

simulated function LightDown()
{
	FireParticleComponent.SetHidden(true);
	Mesh.SetMaterial(0, MaterialInstanceConstant'vincent_materials.scripts.M_UDK_Torch_MASTER_INST_OFF');
	FireSound.Stop();
	FireLightComponent.SetEnabled(false);
}

simulated function LightUp()
{
	FireParticleComponent.SetHidden(false);
	Mesh.SetMaterial(0, MaterialInstanceConstant'vincent_materials.scripts.M_UDK_Torch_MASTER_INST');
	FireSound.Play();
	FireLightComponent.SetEnabled(true);
}

DefaultProperties
{
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
		//bAutoPlay=true
		VolumeMultiplier=0.5
		SoundCue=SoundCue'A_Vehicle_Generic.Fire.VehicleDerbisLoop_Cue'
	End Object
	FireSound=AudioComponent0

	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'vincent_materials.scripts.SK_RV_Torch_3rd'
	End Object
}
