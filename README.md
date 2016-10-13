# FlexibleTable

Prints a table that can have different column widths that also respond in size relative to the size of the terminal window


## Example Usage (You can run 'rake demo' to see the output)


### 1. Basic Default Table

```
table = FlexibleTable.new
table.add_column("Cool Stuff", 10) # specifies a column using %10 of the terminal width
table.add_column("Other Stuff", 10)
table.add_column("More Stuff", 10)

table.print_header
table.print_row("im column 1", "im column 2", "im column 3")
table.print_row("im column 1", "im column 2", "im column 3")
table.print_row("im column 1", "im column 2", "im column 3")
```

### 2. Justify Text

```
table = FlexibleTable.new
table.add_column("Cool Stuff", 10, justify_header: :right, justify_row: :left)
table.add_column("Other Stuff", 10) # defaults to left justify everything
table.add_column("More Stuff", 10, justify_row: :right)

table.print_header
table.print_row("im column 1", "im column 2", "im column 3")
table.print_row("im column 1", "im column 2", "im column 3")
table.print_row("im column 1", "im column 2", "im column 3")
```

### 3. Adding Color

```
using TerminalUtils::Color
table = FlexibleTable.new
table.add_column("Cool Stuff".fg_red, 15)
table.add_column("Other Stuff".fg_green, 15)
table.add_column("More Stuff".fg_red, 15)

table.print_header
table.print_row("im column 1".fg_green, "im column 2", "im column 3")
table.print_row("im column 1", "im column 2".fg_magenta, "im column 3")
table.print_row("im column 1".bg_grey, "im column 2", "im column 3".fg_bright_yellow)
```
