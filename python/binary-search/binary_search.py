def find(search_list, value):
    if not search_list:
        raise ValueError(f"{value} not found in list.")

    mid_point = len(search_list) // 2
    if value == search_list[mid_point]:
        return mid_point
    elif value > search_list[mid_point]:
        mid_point += 1
        return mid_point + find(search_list[mid_point:], value)
    else:
        return find(search_list[:mid_point], value)
