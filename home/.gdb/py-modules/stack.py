import gdb

def indented_name(frame):
    # frame.level() is not always available,
    # so we traverse the list and count depth

    f = frame
    depth = 0
    while (f):
        depth = depth + 1
        f = f.older()
    return "%s%s" % ("  " * depth, frame.name())
