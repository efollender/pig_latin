#require 'byebug'
require './lib/pig_latin.rb'
describe PigLatin do
  describe PigLatin::WordDetect do
    it "should return false if the word contains non-letters" do
      word = "brazos800"
      expect(PigLatin::WordDetect.validate(word)).to be_false
    end
    it "should return true if the word contains only letters" do
      word = "salamander"
      expect(PigLatin::WordDetect.validate(word)).to be_true
    end
    it "should return vowel for a word that starts with a vowel" do
      word = "oklahoma"
      expect(PigLatin::WordDetect.checkType(word)).to eq("vowel")
    end
  end
  describe PigLatin::ConvertWord do
    it "should return the pig latin translation of a given word" do
      word = "giraffes"
      expect(PigLatin::ConvertWord.convert(word)).to eq("iraffesgay")
    end
    it "should return an error message when given a non-word" do
      word = "8ball"
      expect(PigLatin::ConvertWord.convert(word)).to eq("There's been an error. Check your input")
    end
    it "should return the pig latin translation of a word that start with y" do
      word = "yellow"
      expect(PigLatin::ConvertWord.convert(word)).to eq("ellowyay")
    end
    it "should return the pig latin translation of a word that has a y in the middle" do
      word = "rhythm"
      expect(PigLatin::ConvertWord.convert(word)).to eq("ythmrhay")
    end
    it "should return the pig latin translation of a word that starts with a vowel" do
      word = "oklahoma"
      expect(PigLatin::ConvertWord.convert(word)).to eq("oklahomaway")
    end
  end
end
