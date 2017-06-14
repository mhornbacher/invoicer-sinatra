module NumberFormatter
    def number_to_currency(number)
        # Formatter taken from https://stackoverflow.com/questions/4175326/does-ruby-have-any-number-formatting-classes
        number = number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse.split(".")
        "#{number[0]}.#{number[1][0..1]}"
    end
end