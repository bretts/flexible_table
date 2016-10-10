class FlexibleColumn
    def initialize(header, width_percentage, justify_column_content: :left, justify_column_header: :left)
        @header                  = header
        @width_percentage        = width_percentage
        @justify_column_header   = justify_column_header
        @justify_column_content  = justify_column_content
    end
    attr_reader :width_percentage, :header, :justify_column_content, :justify_column_header
end