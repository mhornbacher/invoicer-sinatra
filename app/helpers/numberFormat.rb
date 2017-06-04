module NumberFormatter
    def number_to_currency(number)
        # Formatter taken from https://stackoverflow.com/questions/4175326/does-ruby-have-any-number-formatting-classes
        number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end
end