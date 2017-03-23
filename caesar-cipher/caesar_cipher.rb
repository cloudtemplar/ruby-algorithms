class CaesarCipher

  def self.encrypt(string, shift_factor)
    uppercases = ('A'..'Z').to_a
    lowercases = ('a'..'z').to_a
    uppercases_shifted = uppercases.rotate(shift_factor)
    lowercases_shifted = lowercases.rotate(shift_factor)

    encrypted_string = ''
    string.each_char do |char|
      if uppercases.include?(char)
        original_index = uppercases.index(char)  
        encrypted_string << uppercases_shifted[original_index]
      elsif lowercases.include?(char)
        original_index = lowercases.index(char)  
        encrypted_string << lowercases_shifted[original_index]
      else
        encrypted_string << char
      end
    end
    encrypted_string
  end

end


=begin
our plan:
get string
iterate through each character. we want to save case
if character is capital, add (factor) to its Ascii value
resolving value cant exceed ascii range for capitals
do the same for "little" letters

A-Z ==  65- 90
a-z ==  97-122


=end