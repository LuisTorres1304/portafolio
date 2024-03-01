from tkinter import *
from tkinter import ttk

ws = Tk()
ws.title('PythonGuides')
ws.geometry('500x500')
ws['bg'] = '#AC99F2'

game_frame = Frame(ws)
game_frame.pack()

# scrollbar
game_scroll = Scrollbar(game_frame)
game_scroll.pack(side=RIGHT, fill=Y)

game_scroll = Scrollbar(game_frame, orient='horizontal')
game_scroll.pack(side=BOTTOM, fill=X)

my_game = ttk.Treeview(game_frame, yscrollcommand=game_scroll.set, xscrollcommand=game_scroll.set)

my_game.pack()

game_scroll.config(command=my_game.yview)
game_scroll.config(command=my_game.xview)

# define our column

my_game['columns'] = ('player_Name', 'player_Country', 'player_Medal')

# format our column
my_game.column("#0", width=0, stretch=NO)
my_game.column("player_Name", anchor=CENTER, width=80)
my_game.column("player_Country", anchor=CENTER, width=80)
my_game.column("player_Medal", anchor=CENTER, width=80)

# Create Headings
my_game.heading("#0", text="", anchor=CENTER)
my_game.heading("player_Name", text="Id", anchor=CENTER)
my_game.heading("player_Country", text="Name", anchor=CENTER)
my_game.heading("player_Medal", text="Rank", anchor=CENTER)

ws.mainloop()