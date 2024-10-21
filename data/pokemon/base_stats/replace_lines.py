import os

def replace_lines_in_asm(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    if len(lines) >= 17:
        lines[11] = '    db 0 ; unused1\n'  # Line 12 (index 11)
        lines[16] = '    db 0 ; unused2\n'  # Line 17 (index 16)

    with open(file_path, 'w') as file:
        file.writelines(lines)

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.asm'):
                file_path = os.path.join(root, file)
                replace_lines_in_asm(file_path)

if __name__ == "__main__":
    current_directory = os.path.dirname(os.path.abspath(__file__))
    process_directory(current_directory)
