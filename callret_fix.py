import os
import re

def replace_calls_in_file(file_path):
    with open(file_path, 'r') as file:
        content = file.readlines()

    # Regex to find call followed by any routine name and ret, but not ret c, ret nc, ret z, ret nz
    pattern = re.compile(r'\bcall\s+(\w+)\s*\n\s*ret\b(?!\s*c|\s*nc|\s*z|\s*nz)')

    new_content = []
    i = 0
    while i < len(content) - 1:
        line_combined = content[i] + content[i + 1]
        if pattern.search(line_combined) and not re.search(r'\bfarcall\s+\w+\b', content[i]):
            routine_name = pattern.search(line_combined).group(1)
            new_content.append(f'jmp {routine_name}\n')
            i += 2  # Skip the next line
        else:
            new_content.append(content[i])
            i += 1

    # Add the last line if it wasn't processed
    if i < len(content):
        new_content.append(content[i])

    with open(file_path, 'w') as file:
        file.writelines(new_content)

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.asm'):
                file_path = os.path.join(root, file)
                replace_calls_in_file(file_path)

if __name__ == "__main__":
    current_directory = os.path.dirname(os.path.abspath(__file__))
    process_directory(current_directory)
