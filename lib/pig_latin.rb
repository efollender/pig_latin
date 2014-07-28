require "pig_latin/version"

module PigLatin
  module WordDetect

    def self.validate(word)
      word !~ /[0-9_\W]/ ? (return true) : (return false)
    end

    def self.checkType(word)
      valid = WordDetect.validate(word)
      if valid
        if /[y]/.match(word[0])
          return "y"
        elsif /(^[^aeiouy]+)/.match(word)
          return "consonant"
        elsif /(^[aeiou])/.match(word[0])
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
        match = /(^[^aeiouy]+)/.match(word)
        return match.post_match + match.to_s + "ay"
      elsif type == "vowel"
        return word + "way"
      elsif type == "error"
        return "There's been an error. Check your input"
      end
    end
  end
end