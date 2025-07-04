# -*- coding: utf-8 -*-
"""Problem 8.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1G-bVkkwGGl3DtaFrvxwCX7KTYjULesk0
"""

import re

T = int(input())

repeaters = {'*', '+', '?'}
for _ in range(T):
    pattern = input()
    try:
        # Check manually for invalid repeated repeaters like "*+", "+*", etc.
        invalid = any(a in repeaters and b in repeaters for a, b in zip(pattern, pattern[1:]))
        if invalid:
            raise re.error("multiple repeat")
        re.compile(pattern)
        print("True")
    except re.error:
        print("False")

