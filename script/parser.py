from lark import Lark, Transformer, v_args
import pprint

# Define the Transformer class
class VerilogTransformer(Transformer):
    def module(self, items):
        return {"type": "module", "name": items[0], "ports": items[1], "body": items[2:]}

    def port_list(self, items):
        return items

    def port(self, items):
        return {"direction": items[0], "range": (items[1], items[2]), "name": items[3]}

    def port_dir(self, items):
        return items[0]

    def module_body(self, items):
        return items

    def declaration(self, items):
        return items[0]

    def wire_decl(self, items):
        return {"type": "wire", "wires": items[0]}

    def wire_list(self, items):
        return items

    def instantiation(self, items):
        return {"type": "instantiation", "gtype": items[0], "name": items[1], "connections": items[2]}

    def gtype(self, items):
        return items[0]

    def connection_list(self, items):
        return items

    def connection(self, items):
        if len(items) == 3:
            signal = items[1] + "[" + str(items[2]) + "]"
        else:
            signal = items[1]
        return {"port": items[0], "signal": signal}

    def ID(self, items):
        return str(items)

    def NUMBER(self, items):
        return int(items)

# Define the grammar
verilog_grammar = r"""
    ?start: module

    module: "module" ID "(" port_list ")" ";" module_body "endmodule"

    port_list: (port ("," port)*)

    port: port_dir "[" NUMBER ":" NUMBER "]" ID

    port_dir: ID

    module_body: (declaration | instantiation)*

    declaration: wire_decl

    wire_decl: "wire" wire_list ";"

    wire_list: (ID ("," ID)*)

    instantiation: gtype ID "(" connection_list ")" ";"

    gtype: ID

    connection_list: (connection ("," connection)*)

    connection: "." ID "(" ID ("[" NUMBER "]")* ")"

    COMMENT: /\/\/[^\n]*/

    ID: /[a-zA-Z_][a-zA-Z_0-9]*/
    index: "[" NUMBER "]"
    NUMBER: /[0-9]+/

    %import common.WS
    %ignore WS
    %ignore COMMENT
"""

class Statement():
    def __init__(self, gtype, name, inputList, output):
        self.gtype = gtype
        self.name = name
        self.inputList = inputList
        self.output = output

    def tostr(self):
        input_str = ', '.join(self.inputList)
        return f"Statement(Name: {self.name}, Type: {self.gtype}, Inputs: [{input_str}], Output: {self.output})"

    def __eq__(self, other):
        return self.output == other.output and self.inputList == other.inputList and self.gtype == other.gtype and self.name == other.name

    def __lt__(self, other):
        return self.compare(other) == -1

    def __gt__(self, other):
        return self.compare(other) == 1

    def compare(self, other):
        if self.output in other.inputList:
            return -1
        if other.output in self.inputList:
            return 1
        return 0

def insertItem(items, newItem, j):
    # Create a copy of the items
    itemsCpy = items.copy()

    # Handle the case when j is 0
    if j == 0:
        return [newItem] + itemsCpy

    # Handle the case when j is the length of the list
    if j == len(itemsCpy):
        return itemsCpy + [newItem]

    # Handle the general case
    return itemsCpy[:j] + [newItem] + itemsCpy[j:]

def insertStatement(newStatement, sortedStatements):
    for j in range(len(sortedStatements)):
        comparisonResult = newStatement.compare(sortedStatements[j])
        if comparisonResult == -1:
            sortedStatements = insertItem(sortedStatements, newStatement, j)
            return sortedStatements
        if comparisonResult == +1:
            pass
    sortedStatements.append(newStatement)
    return sortedStatements

def sortStatements(statements):
    sortedStatements = []
    for i in range(len(statements)):
        newStatement = statements[i]
        sortedStatements = insertStatement(newStatement = newStatement, sortedStatements = sortedStatements)
    return sortedStatements

class Wire():
    def __init__(self, name):
        self.name = name

    def toStr(self):
        return f"Wire(Name: {self.name})"

class Port():
    def __init__(self, name, direction, rangeStart, rangeEnd):
        self.name = name
        self.direction = direction
        self.rangeStart = rangeStart
        self.rangeEnd = rangeEnd

    def toStr(self):
        return f"Port(name={self.name}, direction={self.direction}, rangeStart={self.rangeStart}, rangeEnd={self.rangeEnd})"

class Parser():
    def __init__(self):
        # Create the Lark parser
        self.larkParser = Lark(verilog_grammar, parser='lalr', transformer=VerilogTransformer())
        self.parseTree = None
        self.statementList = []
        self.wireList = []
        self.portList = []
        self.moduleName = ""

    def parse(self, inStr):
        self.parseTree = self.larkParser.parse(inStr)
        self.getStatementsList()
        self.statementList = sortStatements(self.statementList)
        self.getWireList()
        self.getPortList()
        self.getName()

    def getWireList(self):
        for item in self.parseTree['body']:
            wireList = self.extractListFromKey(item, 'wire')
        for wireName in wireList[0]['wires']:
            wire = Wire(wireName)
            self.wireList.append(wire)

    def getStatementsList(self):
        for item in self.parseTree['body']:
            instantiationList = self.extractListFromKey(item, 'instantiation')
        for instantiation in instantiationList:
            gtype = instantiation['gtype']
            name = instantiation['name']
            inputList = []
            for IO in instantiation['connections']:
                if IO['port'] == 'Z':
                    output = IO['signal']
                else:
                    inputList.append(IO['signal'])
            statement = Statement(gtype, name, inputList, output)
            self.statementList.append(statement)

    def getPortList(self):
        for port in self.parseTree['ports']:
            name = port['name']
            direction = port['direction']
            rangeStart = port['range'][1]
            rangeEnd = port['range'][0]
            newPort = Port(name, direction, rangeStart, rangeEnd)
            self.portList.append(newPort)

    def getName(self):
        self.moduleName = self.parseTree['name']

    def printTree(self):
        pprint.pprint(self.parseTree)

    def extractListFromKey(self, objList, key):
        returnList = []
        for obj in objList:
            if obj['type'] == key:
                returnList.append(obj)
        return returnList

