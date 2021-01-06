from tkinter import filedialog
import os

# 设置文件对话框会显示的文件类型
my_filetypes = [('all files', '.*'), ('text files', '.txt')]

# 请求选择文件夹/目录
answer = filedialog.askdirectory(initialdir=os.getcwd(),
                                 title="Please select a folder:")

# 请求选择文件
answer = filedialog.askopenfilename(initialdir=os.getcwd(),
                                    title="Please select a file:",
                                    filetypes=my_filetypes)

# 请求选择一个或多个文件
answer = filedialog.askopenfilenames(initialdir=os.getcwd(),
                                     title="Please select one or more files:",
                                     filetypes=my_filetypes)

# 请求选择一个用以保存的文件
answer = filedialog.asksaveasfilename(initialdir=os.getcwd(),
                                      title="Please select a file name for saving:",
                                      filetypes=my_filetypes)