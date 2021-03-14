import sys, code
from parser import parser
from symbol_table import symbol_table as sym

if __name__ == '__main__':
    if len(sys.argv) > 2:
        print("Too many arguments, only one expected")
        exit()
    if len(sys.argv) < 2:
        print("Too few arguments, only one expected")
        exit()
    path = sys.argv[1]
    if path.split(".")[-1] != "asm":
        print("Wrong extension")
        exit()
    slash_idx = -1
    if "/" in path:
        for x in range(len(path)):
            if path[x] == "/":
                slash_idx = x
    dir_path = path[:slash_idx + 1]
    file_name = path[slash_idx + 1:].split('.')[0]
    file_asm = open(path, 'r')
    lines = []
    lines2 = []
    for line in file_asm:
        lines.append(line)
        lines2.append(line)
    file_asm.close()
    file_hack = None
    if slash_idx == -1:
        file_hack = open(file_name + ".hack", 'w')
    else:
        file_hack = open(dir_path + file_name + ".hack", 'w')
    current_address = 0
    symbols = sym()
    current_parser = parser(lines)
    while current_parser.has_more_commands():
        if not current_parser.advance():
            break
        if current_parser.command_type() == "A" or current_parser.command_type() == "C":
            current_address += 1
        if current_parser.command_type() == "L":
            symbols.add_entry(current_parser.symbol(), current_address)
    current_parser = parser(lines2)
    while current_parser.has_more_commands():
        if not current_parser.advance():
            break
        if current_parser.command_type() == "A":
            symbol = current_parser.symbol()
            if symbols.contains(symbol):
                file_hack.write(code.dec_to_bin(int(symbols.get_address(symbol))) + "\n")
            else:
                file_hack.write(code.dec_to_bin(int(symbol)) + "\n")
        elif current_parser.command_type() == "C":
            comp = current_parser.comp()
            dest = current_parser.dest()
            jump = current_parser.jump()
            binary = "111" + code.comp(comp)
            binary += code.dest(dest)
            binary += code.jump(jump)
            file_hack.write(binary + "\n")
    file_hack.close()