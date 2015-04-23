require 'test/unit'


def alphabet
	return ('a'..'z').to_a
end

def is_upcase?(char)
  if char =~ /[[:alpha:]]/
  	char == char.upcase
  else
  	false	
  end	
end

def upcase_array
	@upcase_array
end

def wrap_helper(letter_index)
	if letter_index > 25
		letter_index -= 26 
	else
		letter_index
	end
end

 def string_to_array(string)
  @upcase_array = [] 
  split_array = string.split('')
  split_array.each_with_index do |char, index| 
		 
			#is_upcase?(letter)
  		@upcase_array << index && char.downcase! if is_upcase?(char)
  	
 	end 
  return split_array    #string.downcase.split('') I dont think i need this anymore 
end                      #Because of above


def letter_to_num(letters)
	num_array = []
	letters.each do |char|
		if index = alphabet.index(char)
			num_array << index
		else
			num_array << char
		end		
	end	
	return num_array
end

def num_to_lett(numbers)
	letter_array = []
	numbers.each do |i|
		if i.is_a? Integer
			letter_array << alphabet[i]
		else
			letter_array << i	
		end
	end	
	return letter_array
end

def caesar_cipher(str,shift)
	new_nums = []
	letter_to_num(string_to_array(str)).each do |i|
	if i.is_a? Integer
	 shifted = alphabet[wrap_helper(i + shift)]
			new_nums << shifted
		else
			new_nums << i			
		end  	
	end		
		encrypted_string = ""
		encrypted_array = num_to_lett(new_nums)
		if ! @upcase_array.empty?
			@upcase_array.each { |index| encrypted_array[index].upcase! }			
		end	
		
		encrypted_array.each { |char| encrypted_string << char }
		
		return encrypted_string
end




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
  	assert_equal "foo".split(''), string_to_array('FOO')	
  end

  def test_upcase_array_instance
  	string_to_array("HEllO,! Y")
  	assert_equal [0,1,4,8], upcase_array, "should only count capital letters"
  	
  end

  def test_array_to_number_index
  	assert letter_to_num(['a','b','c']) , 'method is not true'
  	assert_equal [0, 1, 2], 
  								letter_to_num(string_to_array("abc"))
  	assert_equal [0, 1, '!', 2], 
                  letter_to_num(string_to_array("ab!c")), "non letter 
                  																				 characters"							
  	assert_equal [0, 1, '3', 2],	
  								letter_to_num(string_to_array("ab3c"))
  end

   def test_wrap_helper
  	assert wrap_helper(28) , 'method is not true'
  	assert_equal 1, wrap_helper(27)
   end 

   def test_num_to_letter
		 assert num_to_lett([0,1,2]), "method is not true"		   		
   	 assert_equal "abc".split(''),		
  								num_to_lett([0,1,2])
  	 assert_equal "ab!".split(''),		
  								num_to_lett([0,1,"!"])									
   end	

   def test_caesar_cipher
   	assert caesar_cipher("abc",1), 'method is not true'
   	assert_equal "bcd", caesar_cipher("abc",1), "simple cipher"
   	assert_equal "!c ", caesar_cipher("!b ",1), "different characters"
   	assert_equal "BcD", caesar_cipher("AbC",1), "case-sensitive"
   	assert_equal "AbC", caesar_cipher("XyZ",3), "wrap-around, z to a" 

   end
#do the wrap test
 end




