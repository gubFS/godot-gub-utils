class_name GubTree
extends Object

## calls the callable with the treeitem as a parameter for each item in the tree
static func traverse(item: TreeItem, callable: Callable) -> void:
	if item == null:
		return

	callable.call(item)
	for child: TreeItem in item.get_children():
		traverse(child, callable)

## calls the criteria with the item as a parameter. the criteria should return true if the item matches
static func find_item(start_item: TreeItem, criteria: Callable) -> TreeItem:
	var item_: Array[TreeItem] = [null]
	GubTree.traverse(start_item, func(item: TreeItem) -> void:
		if criteria.call(item):
			item_[0] = item
	)
	
	return item_[0]
