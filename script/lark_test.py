from lark import Lark, Transformer, v_args
import pprint

def getContent(fileName):
    try:
        with open(fileName, 'r') as file:
            content = file.read()
        return content
    except FileNotFoundError:
        return "File not found."
    except Exception as e:
        return f"An error occurred: {e}"


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

# Create the Lark parser
# parser = Lark(verilog_grammar, parser='lalr', transformer=Transformer())

# Create the Lark parser
parser = Lark(verilog_grammar, parser='lalr', transformer=VerilogTransformer())

# Example Verilog code to parse
verilog_code = getContent("../netlist/sample.v")

# Parse the Verilog code
parse_tree = parser.parse(verilog_code)

# Print the parsed structure
pprint.pprint(parse_tree)

