extends Node

@export var _tiles: Array[PackedScene]
@export var _generator: DS_BaseGen
@export var _tile_holder: Node3D
@export var _tile_offset_x:= 0.0
@export var _tile_offset_y:= 0.0
@export var _tile_offset_z:= 0.0

var _tile: Node3D
var _c:= 0

func _process(delta) -> void:
	if !_generator.is_gen_process():
		if _c < _generator.get_grid().get_tiles_size():
			if _get_tile(_c).get_tile_type() != -1:
				_tile = _tiles[_get_tile(_c).get_tile_type()].instantiate() # Instantiating new tile
				_tile.position.x = _tile_offset_x * _get_tile(_c).get_x() # Setting new tile's x pos
				_tile.position.y = _tile_offset_z * _get_tile(_c).get_z() # Setting new tile's y pos
				_tile.position.z = _tile_offset_y * _get_tile(_c).get_y() # Setting new tile's z pos
				_tile.quaternion = _get_tile(_c).get_tile_rotation_quat() # Setting new tile's rotation
				_tile_holder.add_child(_tile) # Adding the tile to the game world
				_tile = null
			_c += 1

## This method gets the indexth tile.
func _get_tile(index:int) -> DS_Tile: return _generator.get_grid().get_tile(index)