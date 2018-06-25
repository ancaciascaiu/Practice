# Write a program that takes input of an integer N, followed by N lines of input sentences. For each sentence, reverse each word in each sentence. The order of words are not reversed.

# Notes:

# Your output lines should not have any trailing or leading whitespaces.
# 0 < Max Number of Inputs <= 100
# 0 < Number of Words in one input < 100
# 0 < Length of Word In A Sentence < 20
# Words will always be separated by a single whitespace.
# Each letter should retain its original case
# Punctuation does not require special treatment.
# Example input:

# 3
# A red flair silhouetted the jagged edge of a wing
# She stared through the window at the storm.
# Waves flung themselves at the blue evening

# Should output:

# A der rialf detteuohlis eht deggaj egde fo a gniw
# ehS derats hguorht eht wodniw ta eht .mrots
# sevaW gnulf sevlesmeht ta eht eulb gnineve


def flip(word)
  word = word.each_char.to_a
  flipped = ""
  word.length.times do 
    flipped << word.last
    word.pop
  end
  flipped
end

index = 0
string = ""
STDIN.read.split("\n").each do |line|
  if index > 0
    line.split(" ").each do |word|
        string += (flip(word) + " ")
    end
    string = string[0...-1]
    string += "\n"
  end
  index += 1
end
puts string