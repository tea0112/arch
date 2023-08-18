#!/usr/bin/env python3

import subprocess
import unittest


def strlist_to_numberlist(str_list):
    for key, str in enumerate(str_list):
        start = str.rfind('0')
        if str[-2] == '0':
            str = str[start:-1]
        else:
            str = str[start+1:-1]
        str_list[key] = str
    return lines

def subprocess_run(command):
    return subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

def subprocess_run_with_pipeline(command):
    return subprocess.run(command, input=result.stdout, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

result = subprocess_run(['efibootmgr'])
entry = subprocess_run_with_pipeline(["awk", "/Boot0.*/ {print $1}"])

lines = entry.stdout.split('\n')
lines = lines[:-1]

answer = 'no'
answer = input("Do you want to remove os entries? (yes, no): ")
if answer.lower() == 'yes':
    print('You have chosen "yes"')
    for entry in strlist_to_numberlist(lines):
        print("this: " + entry)
        delete_os_entries = subprocess.run(['efibootmgr', '-b', entry, '-B'])

class MyUnitTest(unittest.TestCase):
    def test_passall(self):
        str = ['Boot0000*', 'Boot0001*']
        self.assertEqual(strlist_to_numberlist(str), ['0', '1'])
