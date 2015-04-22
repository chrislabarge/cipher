require 'test/unit'


def alphabet_array
	return ('a'..'z').to_a
end


def string_to_array(string)
	return string.split('')
end

def array_to_num(array)
	array_index = [] 
	array.each  { |letter| array_index.push(alphabet_array.index(letter)) }		
	array_index
end


def wrap_helper(letter_index)
	if letter_index > 25
		letter_index -= 26 
	else
		letter_index
	end

end




def shift_letters(index_array, shift)
		new_array = []
		index_array.each { |index| new_array.push(alphabet_array[wrap_helper(index + shift)]) }
		new_array
end

	puts shift_letters(array_to_num(string_to_array("x")), 3)	

  puts shift_letters(array_to_num(string_to_array("string")), 2)




class TC_MyTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  #def test_method
  	#assert method_name , 'method is not true'
  #end 
  
  def test_alphabet_array
    assert(alphabet_array, 'Assertion was false.')
  	assert alphabet_array.length == 26
  end

  def test_string_to_array_method
  	assert( string_to_array('string'), 'method is not true')
  	assert_equal "string".split(''), string_to_array('string')	
  end

  def test_array_to_number_index
  	assert array_to_num(['a','b','c']) , 'method is not true'
  	assert_equal [0, 1, 2], 
  								array_to_num(string_to_array("abc"))
  end 
  
  def test_shift_letters
  	assert shift_letters(array_to_num(string_to_array("abc")), 1), 
  																						'method is not true'
		assert_equal ['b','c','d'], 
									shift_letters(array_to_num(string_to_array("abc")), 1) 																						

  end 
  

  	#this handles going back to a when you go over z, use 3 to cause all tOO
  def test_shift_letters_handle_wrap_from_z
  	assert_equal shift_letters(array_to_num(string_to_array("xyz")), 3), 
  																						['a','b','c']
  end

  def test_wrap_helper
  	assert wrap_helper(28) , 'method is not true'
  	assert_equal 1, wrap_helper(27)
  end 

end

