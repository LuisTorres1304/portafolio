from tkinter import *
import sqlite3
from tkinter import ttk


class Producto:

    db = "database/productos.db"

    def __init__(self, root):
        self.ventana = root
        self.ventana.title("App Gestor de Productos")
        self.ventana.resizable(1,1)
        #self.ventana.wm_iconbitmap("recursos/M6_P2_icon.ico")

        #creacion cel contenedor Frame principal
        frame= LabelFrame(self.ventana, text="Registrar un Producto")
        frame.grid(row = 0, column = 0, columnspan = 5, pady =30)

        # Label nombre
        self.etiqueta_nombre = Label(frame, text="Nombre: ")
        self.etiqueta_nombre.grid(row=1, column=0)

        #Entry nombre
        self.nombre = Entry(frame) # Entry Nombre (caja de texto que recibira el nombre)
        self.nombre.focus() # para que se ubique el cursor en el cajon de texto al iniciar el app
        self.nombre.grid(row=1, column=1)

        # Label precio
        self.etiqueta_precio = Label(frame, text="Precio: ")
        self.etiqueta_precio.grid(row=2, column=0)

        # Entry nombre
        self.precio = Entry(frame) # Entry Nombre (caja de texto que recibira el Precio)
        self.precio.grid(row=2, column=1)

        # Label Ctegoria
        self.etiqueta_categoria = Label(frame,text= "Categoria: ")
        self.etiqueta_categoria.grid(row=3, column=0)

        #Entry Categoria
        self.categoria = Entry(frame)
        self.categoria.grid(row=3, column= 1)

        #Label Stock
        self.etiqueta_stock = Label(frame, text="Stock: ")
        self.etiqueta_stock.grid(row=4, column= 0)

        #Entry Stock
        self.stock = Entry(frame)
        self.stock.grid(row=4, column=1)


        #Boton Añadir Producto
        self.boton_aniadir = ttk.Button(frame, text="Guardar Producto") # esta funcion no debe llevar parentesis
        self.boton_aniadir.grid(row=5, columnspan=2, sticky= W+E) # sticky sirve para rellenar por coordenadas

        self.mensaje = Label(text="" , fg= "red")
        self.mensaje.grid(row=6, column=0, columnspan=2, sticky=W + E)

        #Tabla de productos
        # Estilo personalizado para la tabla
        style = ttk.Style()
        style.configure("mystyle.Treeview", highlightthickness=0, bd=0, font=('Calibri',11))  # Se modifica la fuente de la tabla
        style.configure("mystyle.Treeview.Heading", font=('Calibri', 13, 'bold'))# Se modifica la fuente de las cabeceras
        style.layout("mystyle.Treeview", [('mystyle.Treeview.treearea', {'sticky':'nswe'})])  # Eliminamos los bordes

        #Estructura de la tabla
        columns = ('Nombre', 'Precio', 'Categoria','Stock')
        self.tabla = ttk.Treeview(height=10, columns=columns,show='headings', style="mystyle.Treeview")
        self.tabla.grid(row=8, column=0, columnspan=3)
        self.tabla.heading("Nombre", text="Nombre", anchor= CENTER) #ENCABEZADO 1
        self.tabla.heading("Precio", text="Precio", anchor= CENTER)
        self.tabla.heading("Categoria", text="Categoria", anchor=CENTER)
        self.tabla.heading("Stock", text="Stock", anchor= CENTER)

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


if __name__ == "__main__":
    root = Tk() #instancia de la ventana principal
    app = Producto(root)  # Se envia a la clase Producto el control sobre la     ventana    root
    root.mainloop()
