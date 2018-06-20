import os
import io
import json
import sys


try:
    path = sys.argv[1]
except IndexError:
    print("Please supply an absolute path to where your notes are stored")
    exit()

new_path = '/home/joe/.nvpy/'

for _file in os.listdir(path):
    try:
        file_content = io.open(path + _file, encoding = "utf-8").read()

        modification_time = os.path.getmtime(path + _file)

        nvpy_entry = json.dumps({
            'modifydate': modification_time,
            'tags': [],
            'createdate': modification_time,
            'syncdate': 0,
            'content': file_content,
            'savedate': modification_time
        })

        file_object = open(new_path + _file + '.json', 'w')
        file_object.write(nvpy_entry)

    except UnicodeDecodeError:
        print("Failed to read file: " + path + _file)
