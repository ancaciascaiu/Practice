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
      first_part  = 'No more bottles of beer on the wall, no more bottles of beer.'
      second_part = 'Go to the store and buy some more, 99 bottles of beer on the wall.'
    elsif number_of_bottles == 1
      first_part  = "#{number_of_bottles} bottle of beer on the wall, #{number_of_bottles} bottle of beer."
      second_part = 'Take it down and pass it around, no more bottles of beer on the wall.'
    else
      bottle_str = number_of_bottles == 2 ? 'bottle' : 'bottles'
      first_part  = "#{number_of_bottles} bottles of beer on the wall, #{number_of_bottles} bottles of beer."
      second_part = 'Take one down and pass it around, ' \
                    "#{number_of_bottles - 1} #{bottle_str} of beer on the wall."
    end

    first_part + "\n" + second_part + "\n"
  end
end
