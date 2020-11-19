from Compiler import *
import sys
import os

def compile_dir(dir_path):
    comiler = Compiler()
    for filePath in os.listdir(dir_path):
        filePath = dir_path + '/' + filePath
        if filePath.endswith('.h') is False:
            continue
        print(filePath)
        contents = comiler.compile(filePath)
        print(contents)
        output_file = filePath.replace('.h', '.m')
        print(output_file)
        with open(output_file, 'w+') as fw:
            fw.write(contents)

dir = sys.argv[1]
# dir = '/Users/rykeryin/Coding/Publish/KKHook'

if __name__ == '__main__':
    print(dir)
    for dir_path, dirnames, filenames in os.walk(dir):
        print('Directory', dir_path)
        if 'hook_' in dir_path:
            contain_m = False
            for path in os.listdir(dir_path):
                if '.m' in path:
                    contain_m = True
            if contain_m is False:
                compile_dir(dir_path)


