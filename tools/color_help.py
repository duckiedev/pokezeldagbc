def bgr_to_rgb(hex_value):
    b = (hex_value & 0x7C00) >> 10
    g = (hex_value & 0x03E0) >> 5
    r = hex_value & 0x001F
    return r, g, b

hex_values = [0x7FFF, 0x4D6B, 0x30E7, 0x0000]
rgb_values = [bgr_to_rgb(hex_value) for hex_value in hex_values]
print(rgb_values)