# Look over the article Kevin posted on the Whiteboard repo.


# Nodes that comprise the tree
class TreeNode
  def initialize(value, left_child = nil, right_child = nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
    # @children = []
    # for non-binary-search trees
  end
end

# Tree class for binary searches
class BinarySearchTree

  def initialize(node)
    @root = node
  end

  def insert_node(node) # I think this should take a position or value parameter
    current_node = self.root
    # should this use breadth-first or depth-first tree traversal?
    # base case if position == 0 or is root?
    until current_node.right.nil? && current_node.left_child.nil?
      # This only seems to plan to add nodes to the end of a tree branch
      # Need to rewrite it so that it can add a node anywhere in the tree
      # Example: what if the tree has only a root, or a root and one leaf
      # Write/Draw some edge cases for this and revise it
      if node.value < root.value
        current_node = current_node.left_child
      elsif
        current_node = current_node.right_child
      else
        raise ArgumentError.new("Nodes with duplicate values are excluded from binary search trees. Please add a non-duplicate value.")
      end
    end
    # Whiteboard this and make sure it covers the edge case
    if current_node == self.root
      current_node.left_child = node if node.value < current_node.value
      current_node.right = node if node.value > current_node.value
    else
      current_node.left_child = node
      current_node.right_child = node
    end
  end

  def is_value_present?(value, tree)
    # if is_valid_binary_search_tree?(tree)
      queue = []
      queue << tree.root
      p queue
      until queue.empty?
        return true if current_node.value == value
        current_node = queue.unshift
        # can iterate through current_node.children for non-binary trees
        if current_node.left_child.value <= value
          queue << current_node.left_child
        else current_node.right_child.value >
          queue << current_node.right_child
        end
      end
    # end
    return false
  end

  def is_valid_binary_search_tree?(tree)
    # conditional logic
  end

  def delete(node)

  end

end
root = TreeNode.new(8)
bst = BinarySearchTree.new(root)
bst.is_valid_binary_search_tree?(bst)
bst.is_value_present?("root node", bst)
node = TreeNode.new(3)
node2 = TreeNode.new(10)
node3 = TreeNode.new(5)
node4 = TreeNode.new(9)
node5 = TreeNode.new(1)
node6 = TreeNode.new(6)
node7 = TreeNode.new(7)