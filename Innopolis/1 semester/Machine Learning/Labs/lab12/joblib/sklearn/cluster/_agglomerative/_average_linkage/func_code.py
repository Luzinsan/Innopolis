# first line: 710
def _average_linkage(*args, **kwargs):
    kwargs["linkage"] = "average"
    return linkage_tree(*args, **kwargs)
