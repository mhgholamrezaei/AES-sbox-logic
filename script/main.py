import sys
from util import *
from parser import *


if __name__ == "__main__":
    fileContent = getContent(sys.argv[1])

    # Example Verilog code to parse
    verilogCode = getContent("../netlist/sample.v")

    # Parser ctor
    parser = Parser()

    # Parse the Verilog code
    parser.parse(fileContent)

    print(parser.moduleName)
    for wire in parser.wireList:
        print(wire.toStr())
    for port in parser.portList:
        print(port.toStr())
    for statement in parser.statementList:
        print(statement.tostr())
