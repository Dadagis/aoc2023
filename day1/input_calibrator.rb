inputs = File.open('inputs.txt').read

NUMBERS_LITERAL = %w[zero one two three four five six seven eight nine]

def convert_sanitized_literals(sanitized_literals)
  sanitized_literals.map do |sanitized_number|
    converted_number = NUMBERS_LITERAL.index(sanitized_number).to_s
    next converted_number unless converted_number.empty?

    sanitized_number
  end
end

def construct_calibration(raw_coordinates)
  (raw_coordinates[0] + raw_coordinates[-1]).to_i
end

total_array = inputs.split.map do |input|
  cleaned_input = input.gsub(/\D/, '')
  construct_calibration(cleaned_input)
end

p "Part one result : #{total_array.sum}"

new_total_array = inputs.split.map do |input|
  sanitized_literals = input.scan(/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/).flatten

  converted_input = convert_sanitized_literals(sanitized_literals)
  construct_calibration(converted_input)
end

p "Part two result : #{new_total_array.sum}"