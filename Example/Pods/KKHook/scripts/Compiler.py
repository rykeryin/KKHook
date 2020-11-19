from Interface import *
from TokenSpliter import *

class Compiler(object):
    def __init__(self):
        self.file = None
        self.spliter = TokenSpliter()

    def _read_file_lines(self, file):
        with open(file, 'r+') as fr:
            lines = fr.readlines()
        return lines

    # KKClassHookImported(KKViewController)
    #
    # - (void)
    # hook_viewDidLoad
    # {
    #     [self hook_viewDidLoad];
    # }
    #
    # KKClassHookEnd

    def gen_implementation(self, interface)->str:
        contents = "#import \"{0}\"\n#import <KKHook/KKClassHook.h>\n\nKKClassHookImported({1})\n\n".format(interface.fileName, interface.className)
        for method in interface.methods:
            contents += method.body
            contents += '\n'
        contents += '\nKKClassHookEnd'
        return contents

    def compile(self, file_path: str) -> str:
        interface = Interface()
        interface.filePath = file_path
        interface.fileName = file_path.split('/')[-1]
        interface.className = interface.fileName.split('.')[0]
        interface.lines = self._read_file_lines(file_path)
        method_texts = self.spliter.split_interface(interface.lines)
        for i, method_text in enumerate(method_texts):
            method = self.spliter.split_method(method_text)
            interface.methods.append(method)
        return self.gen_implementation(interface)