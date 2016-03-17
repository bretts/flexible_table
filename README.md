FlexibleTable
===========

PURPOSE
-------
Prints a table that can have different column widths that also respond in size relative to the size of the terminal window


EXAMPLE USAGE
-------------
    1) Create a table with a bunch of columns and specify their width percetages (percentage of the terminal window width that the column should occupy). Finally, print rows to your hearts delight.

        table = FlexibleTable.new
        table.add_column("Cool Stuff", 40)
        table.add_column("Other Stuff", 20)
        table.add_column("More Stuff", 40)

        table.print_header
        table.print_row("hello", "to", "you")
        table.print_row("where is the beef", "i asked", "you")