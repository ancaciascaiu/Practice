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
    first_part(number_of_bottles) + "\n" + second_part(number_of_bottles) + "\n"
  end

  private

  def first_part(number_of_bottles)
    number_of_bottles = "no more" if number_of_bottles == 0
    beginning_verse_number_of_bottles = number_of_bottles.is_a?(Numeric) ? number_of_bottles : (number_of_bottles.capitalize)
    "#{beginning_verse_number_of_bottles} #{bottle_number(number_of_bottles)} of beer on the wall, #{number_of_bottles} #{bottle_number(number_of_bottles)} of beer."
  end

  def second_part(number_of_bottles)
    number_of_bottles_left = number_of_bottles - 1
    bottle_reference = number_of_bottles == 1 ? "it" : "one"

    if number_of_bottles_left == 0
      end_part = "no more bottles of beer on the wall."
    else
      end_part = "#{number_of_bottles_left} #{bottle_number(number_of_bottles_left)} of beer on the wall."
    end

    if number_of_bottles == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take #{bottle_reference} down and pass it around, " + end_part
    end
  end

  def bottle_number(number_of_bottles)
    number_of_bottles == 1 ? 'bottle' : 'bottles'
  end
end
