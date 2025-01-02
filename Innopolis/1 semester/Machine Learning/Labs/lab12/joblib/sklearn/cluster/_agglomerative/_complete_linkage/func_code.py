# first line: 705
def _complete_linkage(*args, **kwargs):
    kwargs["linkage"] = "complete"
    return linkage_tree(*args, **kwargs)
