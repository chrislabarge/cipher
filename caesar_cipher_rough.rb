require 'test/unit'


def alphabet
	return ('a'..'z').to_a
end

def is_upcase?(str)
   
  str == str.upcase
end


def string_to_array(string)
  @upcase_array = [] 
  split_array = string.split('')
  split_array.each  { |letter| @upcase_array << split_array.index(letter.downcase!) if is_upcase?(letter) }
  return split_array    #string.downcase.split('') I dont think i need this anymore 
end                      #Because of above

def array_to_num(array)
	array_index = [] 
	array.each  do |char| 
    if letter?(char) 
      array_index.push(alphabet.index(char)) 
    else
      array_index.push(char)
    end 

  end 		
	array_index
end


def wrap_helper(letter_index)
	if letter_index > 25
		letter_index -= 26 
	else
		letter_index
	end

end

def letter?(char)
  char =~ /[[:alpha:]]/
end

def number?(num)
  num =~ /[[:digit:]]/
end 


def shift_letters(index_array, shift)
		new_array = []
    index_array.each do |i| 
      if number?(i)
        new_array.push(alphabet[wrap_helper( i + shift)]) 
      else
        new_array.push(i)
      end    
    end
    if @upcase_array.empty? == false
      @upcase_array.each { |index| (new_array[index]).upcase! }
      #new_array.each { |letter| letter.upcase! if @upcase_array.include?(new_array.index(letter)) }
    end	
  	new_array
end



def method_name()
  true 
end

  puts string_to_array("Butt Butt!")
  puts @upcase_array
	
  puts shift_letters(array_to_num(string_to_array("x")), 3)	

  puts shift_letters(array_to_num(string_to_array("StringHello!")), 2)

  puts @upcase_array



class TC_MyTest < Test::Unit::TestCase
  # def setup
  # end

  # def teardown
  # end

  #def test_method
  	#assert method_name , 'method is not true'
  #end 
  
  def test_alphabet
    assert(alphabet, 'Assertion was false.')
  	assert alphabet.length == 26
  end

  def test_string_to_array_method
  	assert( string_to_array('string'), 'method is not true')
  	assert_equal "string".split(''), string_to_array('string')	
  end

  def test_array_to_number_index
  	assert array_to_num(['a','b','c']) , 'method is not true'
  	assert_equal [0, 1, 2], 
  								array_to_num(string_to_array("abc"))
    assert_equal [0, 1, '!', 2], 
                  array_to_num(string_to_array("ab!c")), "non letter characters"              
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

  def test_case_sensative
    assert_equal shift_letters(array_to_num(string_to_array("Xyz")), 3), 
                                              ['A','b','c']                                           
  end  

  def test_space_sensative
    assert_equal shift_letters(array_to_num(string_to_array("Xy z")), 3), 
                                              ['A','b',' ','c']                                           
  end  

  def test_letter_?
    assert letter?("H") , 'method is not true'
    assert !letter?("2") , 'method is not true' 
    
  end 

  def test_number_?
    assert number?("2") , 'method is not true'
    assert !number?("H") , 'method is not true' 
    
  end 


  def test_upcase_method
    assert is_upcase?("HELLO") , 'method is not true'
  end 


  #need to account for other characters like CAPITAL, and explanation !!!

end

