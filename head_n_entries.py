# get first 1000 entries from file

import sys
import json

def get_first_n_entries(file_path, n):
    with open(file_path, 'r') as json_file:
        data = json.load(json_file)

    first_n_entries = data[:n]
    return first_n_entries

def write_to_json_file(entries, output_file):
    with open(output_file, 'w') as json_output:
        json.dump(entries, json_output, indent=2)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python script_name.py <file_path> <n>")
        sys.exit(1)

    file_path = sys.argv[1]
    n = int(sys.argv[2]) if len(sys.argv) > 1 else 1000
    
    first_n_entries = get_first_n_entries(file_path, n)

    # Writing the first n entries to a new JSON file
    output_file = "first_1000.json"
    write_to_json_file(first_n_entries, output_file)

    print(f"The first {n} entries have been written to {output_file}.")

