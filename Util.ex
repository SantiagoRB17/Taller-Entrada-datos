defmodule Util do
  @moduledoc """
  Módulo con funciones que se reutilizan
  - autor: Nombre del autor.
  - fecha: Fecha de creación.
  - licencia: GNU GLP v3
  """

  @doc """
  Función para mostrar un mensaje en la pantalla.
  ## Parámetros
    - mensaje: texto que se le presenta al usuario.
  ## Ejemplo
    iex> Util.mostrar_mensaje("Hola, mundo!")
    o puede usar
    "Hola mundo"
    |> Util.mostrar_mensaje()
  """
  def mostrar_mensaje(mensaje)do
    mensaje
    |> IO.puts()
  end
  @doc """
  Muestra un mensaje usando un cuadro de diálogo en Python.

  ## Parámetros
    - mensaje: texto que se le presenta al usuario.

  ## Ejemplo
      iex> Util.mostrar_mensaje_python("Hola desde Python")
  """
  def mostrar_mensaje_python(mensaje)do
    System.cmd("cmd.exe",["/c", "python", "mostrar_dialogo.py", mensaje])
  end
  @doc """
  Muestra un mensaje usando un cuadro de diálogo en Java.

  ## Parámetros
    - mensaje: texto que se le presenta al usuario.

  ## Ejemplo
      iex> Util.mostrar_mensaje_java("Hola desde Java")
  """
  def mostrar_mensaje_java(mensaje) do
    System.cmd("java",["-cp", ".", "Mensaje", mensaje])
  end
  @doc """
  Solicita al usuario que ingrese un texto por consola.

  ## Parámetros
    - mensaje: texto que se le presenta al usuario.
    - :texto: indica que se espera una entrada de texto.

  ## Ejemplo
      iex> Util.ingresar("Ingrese su nombre: ", :texto)
  """
  def ingresar(mensaje, :texto) do
    mensaje
    |>IO.gets()
    |> String.trim()
  end
  @doc """
  Solicita al usuario que ingrese un texto usando un cuadro de diálogo en Java.

  ## Parámetros
    - mensaje: texto que se le presenta al usuario.
    - :texto: indica que se espera una entrada de texto.

  ## Ejemplo
      iex> Util.ingresar_java("Ingrese su nombre: ", :texto)
  """
  def ingresar_java(mensaje, :texto) do
    # Llama al programa Java para ingresar texto y capturar la entrada
    case System.cmd("java", ["-cp", ".", "Mensaje","input", mensaje]) do
    {output, 0} ->
      IO.puts("Texto ingresado correctamente.")
      IO.puts("Entrada: #{output}")
      String.trim(output) # Retorna la entrada sin espacios extra
      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
        nil
    end
  end
end
