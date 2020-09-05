/// @desc Initialise tile based collision system
 
#macro TILE_SIZE 32

heightsToGet = sprite_get_width(sTilemapCollision);

tiles = heightsToGet / TILE_SIZE;

//create Tiles
var layerid = layer_create(0, "Tiles");
tilemapid = layer_tilemap_create(layerid, 0, 0, tsCollision, tiles, 1);

for (var i = 0; i <= tiles; i++)
{
	tilemap_set(tilemapid,i,i,0)
}

