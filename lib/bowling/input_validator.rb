# frozen_string_literal: true

SCORING_SIGNS = %w[x / -].freeze

module InputValidator
  def self.get_values(input)
    extract_value(input)
  end

  def self.extract_value(input)
    extract_numbers_validation(input)
    extract_special_characters_validation(input)
    check_max_of_strikes(input)
    input.scan(/.{1,2}/)
  end

  # Validations
  def self.extract_numbers_validation(input)
    raise ArgumentError, 'Please check your data' if input.scan(/\d/).size > 12
  end

  def self.check_max_of_strikes(input)
    raise ArgumentError, 'Please check your data' if input.count('X') > 12
  end

  def self.extract_special_characters_validation(input)
    raise ArgumentError, 'Please check your data' if input.split(/\d+/).delete_if(&:empty?).size > 11
  end
end