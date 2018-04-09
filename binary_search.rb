# 1. Describe
class BinaryTree

  class Node
  
    # Initialize a node, taking the name as an argument
    # Able to take in children or not
    attr_accessor :key, :left, :right
    
    def initialize (key)
        @key = key
        @left = nil
        @right = nil
    end
      
    # Inserting a value
    # Duplicate values are not inserted in the tree
    def insert(new_key)
      puts "Inserting.." + new_key.to_s

        #If the value is smaller than where you're checking
        if (new_key < @key) 
          if @left == nil  #Is this empty space?
            #Put it there
            @left = Node.new(new_key)
          else #If theres something there, run it again
            @left.insert(new_key)
          end 
        # If the value is larger than where you're checking
        elsif  (new_key > @key) 
          if #Same deal
            @right == nil
          else
            @right.insert(new_key)
          end 
        end
    end



  end
  
#PUT THOSE NODES TO WORK

  
  # Initialize the tree (plant the seed)
  def initialize
    @root = nil
  end 

  #Insert new values
  def insert(key)
    #Is there a root to this tree?
    if @root.nil?
      #If not, this is the root
      @root = Node.new(key)
      puts "Initializing #{key}"
    else
      #Otherwise, put this value into the tree
      @root.insert(key)
    end
  end  
  
  #Print from parent given (or root) to children..nieces..then up 
  #until parent given is itself the child, then repeat
  def chickens_first(node= @root)
    # Check if node is empty or nil BASE CASE
    return if (node == nil)
    # Traverse the left subtree by recursively calling function
    chickens_first(node.left)
    #Traverse the right subtree recursively
    chickens_first(node.right)
    # Display current node and all before it
    puts node.key.to_s
  end
  
  
  #Print from children to sibling's children, then back up 
  #Child-first till none left, then parents till root
  #Then from left to right
  def eggs_first(node= @root)
    # Check if node is empty or nil BASE CASE
    return if (node == nil) 
    # Display current node and all collected
    puts node.key.to_s
    # Traverse the left subtree by recursively calling function  
    eggs_first(node.left)
    #Traverse the right subtree recursively  
    eggs_first(node.right)
  end
  
  
  # Prints the final output in sorted order, smallest to largest value
  def sorted_search(node= @root)
    return if (node == nil)
    # Small children first (go left)    
    sorted_search(node.left)
    # Then node given 
    puts node.key.to_s
    #Then the bigger kids
    sorted_search(node.right)
  end
  

end 