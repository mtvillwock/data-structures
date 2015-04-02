# Nodes that comprise the tree
class TreeNode
  def initialize(value, left_child = nil, right_child = nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end
end

# Tree class for binary searches
class BinarySearchTree

  def initialize(node)
    @root = node
  end

  def is_value_present?(value, tree)
    if is_valid_binary_search_tree?(tree)
      p "tree valid"
    else
      p "not valid"
    end
  end

  def is_valid_binary_search_tree?(tree)
    p "instance of tree"
    p tree
  end

  def delete(node)

  end

end
root = TreeNode.new("root node")
bst = BinarySearchTree.new(root)
bst.is_valid_binary_search_tree?(bst)
bst.is_value_present?("root node", bst)