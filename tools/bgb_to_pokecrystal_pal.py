def bgr_to_rgb(hex_value):
    b = (hex_value & 0x7C00) >> 10
    g = (hex_value & 0x03E0) >> 5
    r = hex_value & 0x001F
    return r, g, b

def convert_file(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            # Split the line into words and ignore the first word ('dw')
            words = line.strip().split(' ')[1:]
            for word in words:
                # Split the word into individual hex values
                hex_values = word.split(',')
                for hex_value in hex_values:
                    # Remove the '$' prefix and convert to an integer
                    hex_value = int(hex_value[1:], 16)
                    r, g, b = bgr_to_rgb(hex_value)
                    outfile.write(f'RGB {r},{g},{b}\n')

# Replace 'input.txt' and 'output.pal' with the names of your files
convert_file('input.txt', 'output.pal')
