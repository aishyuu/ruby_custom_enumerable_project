module Enumerable
  def my_each_with_index
    self.each_with_index do |elem, index|
      yield(elem, index)
    end
    self
  end

  def my_select
    result = []
    self.each do |elem|
      result.push(elem) if yield(elem)
    end
    result
  end

  def my_all?
    result = []
    self.each do |elem|
      result.push(elem) if yield(elem)
    end
    return result.length == self.length
  end

  def my_any?
    result = []
    self.each do |elem|
      result.push(elem) if yield(elem)
    end
    return result.length >= 1
  end

  def my_none?
    result = []
    self.each do |elem|
      result.push(elem) if yield(elem)
    end
    return result.length == 0
  end

  def my_count
    if !block_given?
      return self.length
    end
    result = 0
    self.each do |elem|
      if yield(elem)
          result += 1
      end
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    self.each do |elem|
      yield(elem)
    end
    self
  end
end
