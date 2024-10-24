import os
import re

def indent_jmp_lines(file_path):
    with open(file_path, 'r') as file:
        content = file.readlines()

    pattern = re.compile(r'^\s*jmp\s')

    new_content = []
    for line in content:
        if pattern.match(line) and not line.startswith(' '):
            new_content.append('    ' + line)  # Indent with 4 spaces
        else:
            new_content.append(line)

    with open(file_path, 'w') as file:
        file.writelines(new_content)

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.asm'):
                file_path = os.path.join(root, file)
                indent_jmp_lines(file_path)

if __name__ == "__main__":
    current_directory = os.path.dirname(os.path.abspath(__file__))
    process_directory(current_directory)
