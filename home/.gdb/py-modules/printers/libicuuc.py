import gdb.printing, re

class UCharPrinter:
    'Print ICU UChar string'

    def __init__(self, val):
        self.val = val

    # tell gdb to print the value in quotes, like a string
    def display_hint(self):
        return 'string'

    # the actual work...
    def to_string(self):
        p_c16 = gdb.lookup_type('char16_t').pointer()
        return self.val.cast(p_c16).string('UTF-16')

# bookkeeping for "info pretty-printer"
class UCharPrinterInfo(gdb.printing.PrettyPrinter):
    # friendly name for printer
    def __init__(self):
        super().__init__('UChar string printer')
        self._re = re.compile('^UChar [\[*]')
 
    # is UCharPrinter appropriate for val?
    def __call__(self, val):
        if self._re.match(str(val.type)):
            return UCharPrinter(val)
