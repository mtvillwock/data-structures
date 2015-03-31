class Node
  attr_accessor :value, :next
  # is pointer or refers_to a better variable name than next? What about child?
  # What about parent/child for going both ways?
  def initialize(value)
    @value = value
  end

  def to_s
    @value # Took this monkeypatch idea from here:
#http://stackoverflow.com/questions/18618447/best-linked-list-in-ruby-without-extending-array
end
end

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize(node)
    @head = node
    @tail = nil
    # tail is for circular LLs
    # starts off as nil
    @size = 0
  end

  def print_list
    current = @head
    index = 0
    while index < @size
      print "#{current.value} -> "
      current = current.next
      index += 1
      if current.nil?
        puts "nil"
        index += 1
      end
    end
  end

  def reverse_list
    # reverses list so that the
    # tail is head and vice versa
    # with all nodes pointing to
    # the opposite node as before
  end

  def add_node_to_tail(node)
    if @tail.nil?
      @head.next = node
      @tail = @head.next
      @size += 1
    else
      @tail.next = node
      @tail = node
      @size += 1
    end
  end

  # def remove_head_node
  #   @head = @head.next
  # end

  # def remove_tail_node
  #   @tail = nil
  # end

  def index(position)
    # LinkedList[position] returns Node at position
    if position == 0
      return @head
    else
      counter = 0
      current_node = @head.next
      counter += 1
      until counter == position
        current_node = current_node.next
        counter +=1
      end
    # returns node at position
    current_node
  end
end

  #alias_method :index, :[]
  # not sure how to do this

  def insert(node, position)
    node_before_position = index(position-1)
    node_at_position = index(position)
    node_before_position.next = node
    node.next = node_at_position
    @size += 1
    node
    # returns inserted node
  end

  def delete(position)
    target_node = index(position)
    node_before_position = index(position -1)
    node_after_position = index(position + 1)
    node_before_position.next = node_after_position
    puts "The node #{target_node} has been deleted."
    @size -= 1
    # returns deleted node
    target_node
  end

  def zip(list)
    left_head = self.head
    right_head = list.head

    until left_head.nil? && right_head.nil?
      left_next_node = left_head.next
      right_next_node = right_head.next

      left_head.next = right_head
      right_head.next = left_next_node if left_next_node

      left_head = left_next_node
      right_head = right_next_node
    end


    #Initialize an output linked list with self.head
    #add the input linked list's head to the end of the output
    #Iterate through the length both linked lists
    #Assuming both linked lists are the same length, we added self[i], then input[i], to the output.
    # You can't access nodes through indices, so we created current_left_node and current_right_node and reassigned them after each iteration
  end

  def iterate
    if block_given?
      current_node = @head
      until current_node.nil?
        yield current_node
        current_node = current_node.next
      end
    else
      print_list
    end
  end

  def prepend_new_head(node)
    node.next = self.head
    # set next value of new node to head
    self.head = node
    # set head to be the new node
  end

  def sort
  end

  def runner
    # fast = self.head.next.next
    # slow = self.head.next
    # until fast.nil? || fast.next.nil?
    # => fast = fast.next.next
    # => slow = slow.next
    # end
  end
end

# Simple Testing
# node = Node.new("head/0th node")
# p node.value
# p node.next
# p list = LinkedList.new(node)
# node2 = Node.new("1st node")
# node3 = Node.new("2nd node")
# node4 = Node.new("3rd node")
# list.add_node_to_tail(node)
# list.add_node_to_tail(node2)
# list.add_node_to_tail(node3)
# list.add_node_to_tail(node4)
# list.print_list
# p list.index(0).value
# p list.index(1)
# p list.index(2)
# p list.index(3).value
# p list.index(4) # no 4th node; returns nil
# node5 = Node.new("4th non-head node, placed at index(2)...third in list counting head")
# p list.insert(node5, 2)
# list.print_list
# p list.delete(4)
# list.print_list
# p list.delete(1)
# list.print_list


a_head = Node.new("List A head")
a_list = LinkedList.new(a_head)
a2 = Node.new("A2")
a3 = Node.new("A3")
a_list.add_node_to_tail(a2)
a_list.add_node_to_tail(a3)
b_head = Node.new("List B head")
b_list = LinkedList.new(b_head)
b2 = Node.new("B2")
b3 = Node.new("B3")
b_list.add_node_to_tail(b2)
b_list.add_node_to_tail(b3)

p "List A pre-zip "
p a_list
p "List B pre-zip "
p b_list
a_list.zip(b_list)
p "List A post-zip "
p a_list
p "List B post-zip "
p b_list

# new_head = Node.new("replacing the head")
# b_list.prepend_new_head(new_head)
# p b_list

p a_list.iterate { |node| node.value << " was iterated"}
# above method returns nil just like #each should
p a_list
# but it redefines values (so is it #map now?)

### OLD VERSION FROM DECEMEBER
# linked_list.rb

# List object composed of many nodes representing a sequence, example: Six Degrees of Separation
# => pointer to first Node (head) in list
# => pointer to last Node (tail) in list

# class LinkedList
#   attr_accessor :head, :tail

#   def initialize(head_node)
#   # Creates list; requires a Node to do so (no list without something in it)
#   raise "LinkedList must be initialized with a Node." unless head_node.is_a? (Node)
#     # First node will be head and tail
#     @head = head_node
#     @tail = head_node
#   end

#   def remove_head # Like Ruby Array#Shift
#     return nil if @head == nil
#     # Prevents removing head/tail of single Node list
#     entry = @head
#     @head = @head.next
#     p entry
#   end

#   def add_tail(node) # Makes a new node (like Ruby Array#Unshift)
#     @tail.next = node
#     @tail = @tail.next
#     # Sets the value of incoming node to be the tail
#   end

#   def remove_tail # Like Ruby Array#Pop
#     raise "LinkedList requires one Node in order to have a head and tail." if @tail.next == nil && @head == nil
#     entry = @tail
#     @tail = @head.previous
#     p entry
#   end

#   def print_list
#     current_node = @head
#     # Prints node values head to tail, stops at tail (which always points to nil)
#     while current_node != nil
#       puts "\tLinkedList Node Value = #{current_node.value}"
#       current_node = current_node.next
#     end
#   end

#   def iterate_list
#     if block_given?
#       current_node = @head
#       # Iterates through node, head to tail, using while loop and feeding block to each node
#       while current_node != nil
#         yield current_node.value
#         current_node = current_node.next
#       end
#     else
#       print_list
#     end
#   end

# end

# # Node objects contain:
# # =>  a value (whatever piece of data, integer, Class, string)
# # =>  a variable pointing to next value in sequence
# # =>  optional: a variable pointing to previous value in sequence

# class Node
#   attr_accessor :value, :next, :previous

#   def initialize(value)
#     @value = value
#   end

# end


# bread = Node.new("bread")
# eggs = Node.new("eggs")
# cheese = Node.new("cheese")

# groceries = LinkedList.new(bread)
# groceries.print_list
# groceries.add_tail(eggs)
# groceries.print_list
# groceries.add_tail(cheese)
# groceries.print_list
# groceries.iterate_list { |i| i << (" x 3") }
# groceries.print_list
# puts "remove tail, should display cheese"
# groceries.remove_tail
# puts "should show list with bread and eggs"
# groceries.print_list
# puts "remove head, should show bread"
# groceries.remove_head
# puts "show print eggs"
# groceries.print_list
