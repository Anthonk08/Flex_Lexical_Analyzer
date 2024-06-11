import subprocess

def run_lexico(input_text):
    # Ejecutar el analizador léxico
    result = subprocess.run(['./lexico.l'], input=input_text.encode(), capture_output=True, text=True)
    return result.stdout

def main():
    input_text = """
    while x < 10 {
        if y == 20 {
            return x + y;
        } else {
            x = x + 1;
        }
    }
    """
    output = run_lexico(input_text)
    tokens = output.splitlines()
    for token in tokens:
        token_type, token_value = token.split(' ', 1)
        print(f"Token Type: {token_type}, Token Value: {token_value}")

if __name__ == "__main__":
    main()
