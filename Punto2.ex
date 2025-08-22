defmodule LongitudDeUnaPalabra do
  @moduledoc """
  Módulo para mostrar la longitud de una palabra ingresada por el usuario.
  """

  @doc """
  Función principal que solicita al usuario una palabra, calcula su longitud
  y muestra el resultado en pantalla.
  """
  def main do
    "Ingrese la palabra: "
    |> Util.ingresar_java(:texto)
    |>generar_mensaje()
    |>Util.mostrar_mensaje_java()
  end
  @doc """
  Recibe una palabra y retorna una cadena con la longitud de la palabra.

  ## Ejemplo

      iex> LongitudDeUnaPalabra.generar_mensaje("elixir")
      "La longitud de la palabra es: 6"
  """
  defp generar_mensaje(palabra) do
    "La longitud de la palabra es: #{String.length(palabra)}"
  end
end
LongitudDeUnaPalabra.main()
