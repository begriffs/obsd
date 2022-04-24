import gdb.printing
import printers.libicuuc

gdb.printing.register_pretty_printer(
    gdb.current_objfile(),
    printers.libicuuc.UCharPrinterInfo())
