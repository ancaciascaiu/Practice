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
    pre_bottles = number_of_bottles.zero? ? 'no more' : number_of_bottles.to_s
    "#{pre_bottles.capitalize} #{bottle_str(number_of_bottles)} of beer on the wall, " +
      "#{pre_bottles} #{bottle_str(number_of_bottles)} of beer."
  end

  def second_part(number_of_bottles)
    number_of_bottles_left = number_of_bottles - 1

    if number_of_bottles.zero?
      'Go to the store and buy some more, 99 bottles of beer on the wall.'
    elsif number_of_bottles == 1
      'Take it down and pass it around, no more bottles of beer on the wall.'
    else
      "Take one down and pass it around, #{number_of_bottles_left} #{bottle_str(number_of_bottles_left)} of beer on the wall."
    end
  end

  def bottle_str(number_of_bottles)
    number_of_bottles == 1 ? 'bottle' : 'bottles'
  end
end
