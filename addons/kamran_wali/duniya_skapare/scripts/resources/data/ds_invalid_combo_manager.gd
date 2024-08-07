@tool
class_name DS_InvalidComboManager
extends Resource

@export_category("Invalid Combo Manager Properties")
@export var _data: Array[DS_InvalidComboData]

## This method adds an element to the data.
func add_element(element:DS_InvalidComboData) -> void: _data.append(element)

## This method removes the given element from the data.
func remove_element(element:DS_InvalidComboData) -> void: _data.erase(element)

## This method removes the indexth element from the data.
func remove_element_index(index:int) -> void: if _is_index(index): _data.remove_at(index)

## This method updates the indexth element.
func update_element_index(element:DS_InvalidComboData, index:int) -> void: if _is_index(index): _data[index] = element

## This method gets the size of the data.
func get_size() -> int: return _data.size()

## This method gets the indexth element from the data.
func get_element(index:int) -> DS_InvalidComboData: return _data[index]

## This method resets the data to default state.
func reset_data() -> void: _data.clear()

## This method checks if the index is valid.
func _is_index(index:int) -> bool: return index >= 0 and index < _data.size()