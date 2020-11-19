from enum import Enum


# 第二步：通过继承的方式，定义一个适合我们使用的枚举类
# 枚举的名字一般都大写
# 继承Enum后枚举值可以是字符串也可以是整型，如果IntEnum则必须整型

class Types(Enum):
    void = ("void", "void")
    NSInteger = ("NSInteger", "NSInteger")
    id = ("id", "id")