class parser:
    def __init__(self, input_file):
        self.input_file = input_file
        self.counter = 0
    
    def has_more_commands(self):
        return not len(self.input_file) == 0
    
    def advance(self):
        self.counter += 1
        print(self.counter)
        self.current_command = self.input_file[0]
        self.input_file.remove(self.current_command)
        self.current_command.replace(' ', '')
        while len(self.current_command) > 0 and self.current_command[0].isspace():
            self.current_command = self.current_command[1:]
        while len(self.current_command) > 0 and self.current_command[-1].isspace():
            self.current_command = self.current_command[:-1]
        if len(self.current_command) == 0 or self.current_command[0] == "/" or self.current_command[0] == "\n":
            if self.has_more_commands():
                self.advance()
            else:
                return False
        while self.current_command[-1] == '\n':
            self.current_command = self.current_command[:-1]
        return True
    
    def command_type(self):
        if self.current_command[0] == '@':
            return 'A'
        elif self.current_command[0] == '(':
            return 'L'
        else:
            return 'C'
    
    def symbol(self):
        if self.command_type() == 'A':
            return self.current_command[1:]
        elif self.command_type() == 'L':
            return self.current_command[1:-1]
    
    def dest(self):
        if "=" in self.current_command:
            return self.current_command.split("=")[0]
        else:
            return ""
    
    def comp(self):
        mnemonic = self.current_command
        if "=" in self.current_command:
            mnemonic = self.current_command.split("=")[1]
        if ";" in mnemonic:
            mnemonic = self.current_command.split(";")[0]
        return mnemonic
    
    def jump(self):
        if ";" in self.current_command:
            return self.current_command.split(";")[1]
        else:
            return ""