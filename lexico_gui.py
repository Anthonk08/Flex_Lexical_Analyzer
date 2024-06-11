import tkinter as tk
from tkinter import filedialog, scrolledtext
import subprocess

class LexerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Analizador Léxico de Anthony Tineo Cabreja. 1-19-0423")
        
        self.text_area = scrolledtext.ScrolledText(root, wrap=tk.WORD, width=60, height=20)
        self.text_area.pack(padx=10, pady=10)

        self.analyze_button = tk.Button(root, text="Analizar texto", command=self.analyze)
        self.analyze_button.pack(pady=5)

        self.result_area = scrolledtext.ScrolledText(root, wrap=tk.WORD, width=60, height=20, state=tk.DISABLED)
        self.result_area.pack(padx=10, pady=10)

    def analyze(self):
        input_text = self.text_area.get("1.0", tk.END).strip()
        with open("ejemploTexto.txt", "w") as file:
            file.write(input_text)
        
        result = subprocess.run(["lexico", "ejemploTexto.txt"], capture_output=True, text=True)
        
        self.result_area.config(state=tk.NORMAL)
        self.result_area.delete("1.0", tk.END)
        self.result_area.insert(tk.END, result.stdout)
        self.result_area.config(state=tk.DISABLED)

if __name__ == "__main__":
    root = tk.Tk()
    app = LexerApp(root)
    root.mainloop()
