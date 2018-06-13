class Bottles
  def song
    verses(99, 0)
  end

  def verses(first_number_of_bottles, second_number_of_bottles)
    first_number_of_bottles
      .downto(second_number_of_bottles)
      .map { |i| verse(i) }
      .join("\n")
  end

  def verse(number_of_bottles)
    if number_of_bottles.zero?
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif number_of_bottles == 1
      "#{number_of_bottles} bottle of beer on the wall, #{number_of_bottles} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      plural = 's' unless number_of_bottles == 2
      "#{number_of_bottles} bottles of beer on the wall, #{number_of_bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{number_of_bottles - 1} bottle#{plural} of beer on the wall.\n"
    end
  end
end
