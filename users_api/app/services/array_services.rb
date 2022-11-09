class ArrayServices
  def initialize(num_of_elements, min=0, max=30)
    @num_of_elements = num_of_elements.to_i
    @min = min.to_i
    @max = max.to_i
  end

  def create_shuffle_array
    rand_array(@num_of_elements, @min, @max)
  end

  def self.get_longest_range(array)
    sorted_array = array.sort
    count = 1
    initial = sorted_array[0]
    final = sorted_array[-1]
    found_ranges = []
    for i in 1...array.length
      if ((sorted_array[i] - sorted_array[i-1]) == 1)
        count = count + 1
        final = sorted_array[i]
        unless (i < (array.length - 1))
          found_ranges.push({ range: [initial, final], count: count })
        end
      else
        if (count > 1)
          found_ranges.push({ range: [initial, final], count: count })
        end
        count = 1
        initial = sorted_array[i]
        final = sorted_array[-1]
      end
    end
    if (found_ranges.length <= 0)
      return []
    end
    found_ranges.max_by { |ele| ele[:count] }[:range]
  end

  private

  def rand_array(num, min, max)
    (min..max).to_a.shuffle.take(num)
  end
end