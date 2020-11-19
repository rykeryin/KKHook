from Method import *
import re

class TokenSpliter(object):
    def __init__(self):
        pass

    def _contain_start_token(self, line):
        return "+(" in line \
            or "+ (" in line \
            or "-(" in line \
            or "- (" in line

    def _contain_end_token(self, line):
        return ";" in line
        pass

    def _empty(self, text):
        return text is None or text == ''

    def split_method(self, text: str) -> Method:
        m = Method()
        m.text = text
        m.mType = text.split('(')[0].strip(' ')
        rough_tokens = re.split(r"\(|\)", text)
        for i, token in enumerate(rough_tokens):
            if (i-4) % 3 == 0:
                token = token.lstrip().rstrip()
                m.tokens.extend(token.split(' '))
            else:
                m.tokens.append(token)
        for i, token in enumerate(m.tokens):
            if i == 0:
                m.mType = token.strip()
            elif i == 1:
                m.returnType = token
            elif (i-2) % 3 == 0:
                m.paramHeaders.append(token.strip())
            elif (i-2) % 3 == 1:
                m.paramTypes.append(token)
            elif (i-2) % 3 == 2:
                m.params.append(token.strip())
        m.paramsCount = len(m.params)

        m.hookMethod += m.mType + ' '
        m.hookMethod += '({})'.format(m.returnType)
        m.hookMethod += 'hook_'

        for i in range(m.paramsCount):

            m.hookMethod += m.paramHeaders[i]
            m.hookMethod += '({})'.format(m.paramTypes[i])
            m.hookMethod += m.params[i]

            m.oriCall += m.paramHeaders[i]
            m.oriCall += m.params[i]
            if i == m.paramsCount-1:
                m.oriCall += '];'
                m.hookMethod += ' {'
            else:
                m.oriCall += ' '
                m.hookMethod += ' '
        m.body += m.hookMethod + '\n    '
        if m.returnType != 'void':
            m.body += 'return '
        m.body += m.oriCall + '\n}'
        return m

    def split_interface(self, lines) -> [str]:
        methods = []
        method = ''
        contacting = False
        for i, line in enumerate(lines):
            contain_start_token_curline = False
            if self._contain_start_token(line):
                contacting = True
                contain_start_token_curline = True
                method += line.replace('\n', ' ').replace(';', '')
            if contacting and self._contain_end_token(line):
                if contain_start_token_curline is False:
                    method += line.replace('\n', ' ').replace(';', '')
                methods.append(method)
                method = ''
                contacting = False
                continue
            if contacting and contain_start_token_curline is False:
                method += line.replace('\n', ' ').replace(';', '')
        return methods
