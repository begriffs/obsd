import gdb

def frame_indented_name(frame):
    # frame.level() is not always available,
    # so we traverse the list and count depth

    f = frame
    depth = 0
    while (f):
        depth = depth + 1
        f = f.older()
    return "%s%s" % ("  " * depth, frame.name())

def frame_path(f, names=[]):
    if (f):
        names.insert(0, f.name())
        return frame_path(f.older(), names)
    return ",".join(names)
