module Enumerable
  # Your code goes here
  # You will first have to define my_each
  # on the Array class. Methods defined in
  # your enumerable module will have access
  # to this method
end

class Array
  # Define my_each here

  def my_each
    return to_enum(:my_each) unless block_given? # se não usar bloco vai retonar o metodo.

    for element in self do
      yield element # seria como o metodos gets, permitindo ao usuario escolher o metodo
    end

    self
  end

  def my_each_with_index(*args)
    return to_enum(:my_each_with_index, *args) unless block_given?

    i = 0
    for element in self do
      yield element, i
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    results = []
    my_each { |element| results.push(element) if yield element}
    results
  end
end
