import sys

def parse(inputString):
    pass
def getContent(fileName):
    try:
        with open(fileName, 'r') as file:
            lines = file.readlines()
        return lines
    except FileNotFoundError:
        return ["File not found."]
    except Exception as e:
        return [f"An error occurred: {e}"]

# Traverse AST and print the nodes

if __name__ == "__main__":
    fileContent = getContent(sys.argv[1])
    print(fileContent)
