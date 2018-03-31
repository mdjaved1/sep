require_relative 'node'

class MinBinaryHeap
  attr_accessor :root
  
  def initialize
     @items = []
     @root  = root 
  end
  
  def insert(node)
    @items << node 
    checkup((@items.size - 1))
    
  end
  
  def checkup(i)
    parent = (i / 2)
    if i == 1
      return
    elsif @items[parent] <= @items[i]
      return 
    else
      switch(i , parent)
      checkup(parent)
    end
  end
  
  
  def checkdown(i)
    child = i * 2
    if child > (@items.size - 1)
      return 
    end
    sec = child < (@items.size - 1)
    rightchild = @items[child]
    leftchild = @items[child + 1]
    if sec < leftchild  && rightchild < leftchild
      child += 1
    elsif @items[i] <= @items[child]
      return 
    end
    switch(i, child)
    checkdown(child)
  end
  
  
  def switch(ele1 , ele2)
    temp = @items[ele1]
    @items[ele1] = @items[ele2]
    @items[ele2] = temp 
  end
  
  
  def find(root, data)
    if root.nil?
      nil 
    elsif root.title == data
      return root 
    elsif root.right != nil 
      find(root.right , data)
    elsif root.left != nil 
      find(root.left ,data)
    end
  end
  
  def delete(node)
    i = find_index(node)
    if node.nil?
      return nil 
    else
      swap(i , (@items.size - 1 ))
      @items.pop
      checkdown(i)
    end
  end
  
  def find_index(node)
    i = 0 
    @items.each do |ele|
      if item.title == node 
        return 
      else
        i += 1
      end
    end
    i 
  end
  
  def printf
    arr = @items
    if !arr.nil?
      arr.each do |ele|
        puts "#{ele.title}#{ele.rating}"
      end
    end
  end
end