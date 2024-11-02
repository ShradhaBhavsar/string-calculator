class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..])
      numbers = parts[1]
    end

    tokens = numbers.split(/#{delimiter}|\n/)
    negatives = tokens.map(&:to_i).select { |n| n < 0 }

    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    tokens.map(&:to_i).sum
  end
end
