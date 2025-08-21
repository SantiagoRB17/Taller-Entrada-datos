defmodule EcoDeMensaje do
  @moduledoc """
  Módulo para mostrar un eco de un mensaje ingresado por el usuario,
  mostrando el mensaje en mayúsculas.
  """

  @doc """
  Función principal que solicita al usuario un mensaje, lo convierte a mayúsculas
  y lo muestra en pantalla.
  """
  def main do
    "Ingrese el mensaje: "
    |>Util.ingresar_java(:texto)
    |>generar_mensaje()
    |>Util.mostrar_mensaje_java()
  end
  @doc """
  Recibe un mensaje y retorna una cadena con el mensaje en mayúsculas.

  ## Ejemplo

      iex> EcoDeMensaje.generar_mensaje("hola")
      "Mensaje en mayúsculas: HOLA"
  """
  defp generar_mensaje(mensaje) do
    "Mensaje en mayúsculas: #{String.upcase(mensaje)}"
  end
end
EcoDeMensaje.main()
