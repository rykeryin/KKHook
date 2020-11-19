
from enum import Enum
class MethodType(Enum):
    mClass = "+",
    mObjc = "-"


class Method(object):
    def __init__(self):
        self.text = ""
        self.tokens = []
        self.mType = ''
        self.returnType = ""
        self.paramHeaders = []
        self.paramTypes = []
        self.params = []
        self.paramsCount = 0
        self.hookMethod = ''
        self.oriCall = '[self hook_'
        self.body = ''