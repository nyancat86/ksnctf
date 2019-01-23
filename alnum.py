# decomposite.py
import sys

target = int(sys.argv[1], 16)

chars = range(0x30, 0x3a) + range(0x40, 0x5b) + range(0x60, 0x7b)
pairs = [(x, y) for x in chars for y in chars]

for x, y in pairs:
    for i in range(0x100):
        if ((x*y) & 0xFF == 0xFF-i) and ((x*y)>>8 == i):
            x *= 0x01010101  # 0x41 => 0x41414141
            if (x*y) & 0xFFFFFFFF == target:
                print "%08x * %02x == %08x" % (x, y, x*y)
