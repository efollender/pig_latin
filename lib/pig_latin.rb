require "pig_latin/version"

module PigLatin
  module WordDetect

    def self.validate(word)
      word !~ /\W+/ ? (return true) : (return false)
    end

    def self.checkType(word)
      valid = WordDetect.validate(word)
      if valid
        if /[y]/.match(word[0])
          return "y"
        elsif /(^[^aeiou]+[^aeiou])/.match(word).to_s
          return "consonant"
        elsif /[aeiou]/.match(word[0])
          return "vowel"
        end
      else
        return "error"
      end
    end
  end
  module ConvertWord
    def self.convert(word)
      type = PigLatin::WordDetect.checkType(word)
      if type == "y"
        return (/[y]/.match(word).post_match + "yay")
      elsif type == "consonant"
        match = /(^[^aeiou]+[^aeiou])/.match(word)
        return match.post_match + match.to_s + "ay"
      elsif type == "vowel"
        return word + "way"
      elsif "error"
        puts "There's been an error. Check your input"
      end
    end
  end
end
