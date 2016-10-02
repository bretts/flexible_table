# FlexibleTable

Prints a table that can have different column widths that also respond in size relative to the size of the terminal window


### Example Usage

Create a table with a bunch of columns and specify their width percetages (percentage of the terminal window width that the column should occupy). Finally, print rows to your hearts delight.

```
 table = FlexibleTable.new
 table.add_column("Cool Stuff", 40)
 table.add_column("Other Stuff", 20)
 table.add_column("More Stuff", 40)

 table.print_header
 table.print_row("im column 1", "im column 2", "im column 3")
 table.print_row("im column 1", "im column 2", "im column 3")
 table.print_row("im column 1", "im column 2", "im column 3")
```

Specify right justify on rows and column headers (default is left justify)
```
 table = FlexibleTable.new
 table.add_column("Cool Stuff", 40, justify_header: :right, justify_row: :left)
 table.add_column("Other Stuff", 20) # defaults to left justify everything
 table.add_column("More Stuff", 40, justify_row: :right)

 table.print_header
 table.print_row("im column 1", "im column 2", "im column 3")
 table.print_row("im column 1", "im column 2", "im column 3")
 table.print_row("im column 1", "im column 2", "im column 3")
```