def get_position(direction, height, width, map_height, map_width):
    if direction.lower() == 'center':
        pos_y = (height - map_height) // 2
        pos_x = (width - map_width) // 2
    elif direction.lower() == 'north':
        pos_y = 0
        pos_x = (width - map_width) // 2
    elif direction.lower() == 'south':
        pos_y = height - map_height
        pos_x = (width - map_width) // 2
    elif direction.lower() == 'west':
        pos_y = (height - map_height) // 2
        pos_x = 0
    elif direction.lower() == 'east':
        pos_y = (height - map_height) // 2
        pos_x = width - map_width
    elif direction.lower() == 'northwest':
        pos_y = 0
        pos_x = 0
    elif direction.lower() == 'northeast':
        pos_y = 0
        pos_x = width - map_width
    elif direction.lower() == 'southwest':
        pos_y = height - map_height
        pos_x = 0
    elif direction.lower() == 'southeast':
        pos_y = height - map_height
        pos_x = width - map_width
    else:
        raise ValueError(f"Invalid direction: {direction}")

    return pos_y, pos_x

def stitch_ablk_files(ablk_files, output_file):
    # Calculate the final width and height
    final_width = max(get_position(d, 0, 0, w, h)[1] + w for _, (h, w, d) in ablk_files.items())
    final_height = max(get_position(d, 0, 0, w, h)[0] + h for _, (h, w, d) in ablk_files.items())

    # Initialize an empty array for the final map data
    final_map_data = bytearray(final_height * final_width)

    # Iterate over each .ablk file and its position
    for ablk_file, (map_height, map_width, direction) in ablk_files.items():
        # Read the .ablk file as binary data
        with open(ablk_file, 'rb') as f:
            map_data = bytearray(f.read())

        # Get the position based on the direction
        pos_y, pos_x = get_position(direction, final_height, final_width, map_height, map_width)

        # Place the map data at the correct position in the final map
        for y in range(map_height):
            for x in range(map_width):
                final_map_data[(pos_y + y) * final_width + (pos_x + x)] = map_data[y * map_width + x]

    # Write the final map data to the output file
    with open(output_file, 'wb') as f:
        f.write(final_map_data)

# Dictionary of .ablk files with their dimensions and positions
ablk_files = {
    'ForestAreaF8.ablk': (5, 5, 'southwest'),  # (height, width, direction)
    'ForestAreaG8.ablk': (5, 5, 'south'),
    'ForestAreaH8.ablk': (5, 5, 'southeast'),
    'ForestAreaF7.ablk': (5, 4, 'west'),
    'ForestAreaG7.ablk': (5, 4, 'center'),
    'ForestAreaH7.ablk': (5, 4, 'east'),
    # Add more maps with their respective dimensions and positions
}

# Call the function with the dictionary of .ablk files and the desired output file
stitch_ablk_files(ablk_files, 'final_map.ablk')