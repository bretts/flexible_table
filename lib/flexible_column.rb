class FlexibleColumn
    def initialize(header, width_percentage, justify_row: :left, justify_header: :left)
        @header           = header
        @width_percentage = width_percentage
        @justify_row      = justify_row
        @justify_header   = justify_header
    end
    attr_reader :width_percentage, :header, :justify_row, :justify_header
end