from Tkinter import Tk, BOTH, RIGHT, RAISED
from ttk import Frame, Button, Style

#GLOBAL VARIABLES

# ----- Window Variables -----
width = 600
height = 700

class Simulator(Frame):
    def clockAdvance():
        changeButtonText("Yay!")

    clockButton = Button(text="Clock++", command=clockAdvance)

    def __init__(self, parent):
        Frame.__init__(self, parent)   
         
        self.parent = parent
        self.pack(fill=BOTH, expand=1)
        self.centerWindow()

        
        self.initUI()

    def centerWindow(self):
      
        global width
        global height

        sw = self.parent.winfo_screenwidth()
        sh = self.parent.winfo_screenheight()
        
        x = (sw - width)/2
        y = (sh - height)/2
        self.parent.geometry('%dx%d+%d+%d' % (width, height, x, y))

    def initUI(self):
      
        self.parent.title("Pipeline Simulator")
        self.style = Style()
        self.style.theme_use("default")
        
        frame = Frame(self, relief=RAISED, borderwidth=1)
        frame.pack(fill=BOTH, expand=1)


        self.pack(fill=BOTH, expand=1)
        global clockButton 
        self.clockButton.pack(pady=10)

    def changeButtonText(text):
        global clockButton
        clockButton.text = text


def main():
  
    root = Tk()
    root.geometry("250x150+300+300")
    app = Simulator(root)
    root.mainloop()  


if __name__ == '__main__':
    main()  