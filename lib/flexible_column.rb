class FlexibleColumn
    def initialize(header, width_percentage)
        @header           = header
        @width_percentage = width_percentage
    end
    attr_reader :width_percentage, :header
end