def stitch_ablk_files(ablk_files, output_file):
    # Calculate the final width and height
    final_width = max(x + w for _, (h, w, y, x) in ablk_files.items())
    final_height = max(y + h for _, (h, w, y, x) in ablk_files.items())

    # Initialize an empty array for the final map data
    final_map_data = bytearray(final_height * final_width)

    # Iterate over each .ablk file and its position
    for ablk_file, (height, width, pos_y, pos_x) in ablk_files.items():
        # Read the .ablk file as binary data
        with open(ablk_file, 'rb') as f:
            map_data = f.read()

        # Place the map data at the correct position in the final map
        for y in range(height):
            for x in range(width):
                final_map_data[(pos_y + y) * final_width + (pos_x + x)] = map_data[y * width + x]

    # Write the final map data to the output file
    with open(output_file, 'wb') as f:
        f.write(final_map_data)

# Dictionary of .ablk files with their dimensions and positions
ablk_files = {
    'ForestAreaG8.ablk': (5, 5, 0, 0),  # (height, width, pos_y, pos_x)
    'ForestAreaH8.ablk': (5, 5, 0, 5),
    # Add more maps with their respective dimensions and positions
}

# Call the function with the dictionary of .ablk files and the desired output file
stitch_ablk_files(ablk_files, 'final_map.ablk')