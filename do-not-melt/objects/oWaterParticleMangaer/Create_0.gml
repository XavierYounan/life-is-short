tilemap = oIceCube.tilemap

grv = 10;

hspDampening = 10 //ten pixels per seccond
hspTransferRatio = 0.8 // this amount of energy goes into the colliding water molecule
vspTransferRatio = 0.8

waterParticles = [];

//Get the pointers of the arrays in the create event
xArrayPointer = shader_get_uniform(shWater, "u_xArray");
yArrayPointer = shader_get_uniform(shWater, "u_yArray");
arrayLengthPointer = shader_get_uniform(shWater, "u_arrayLength")

xArray = [];
yArray = [];