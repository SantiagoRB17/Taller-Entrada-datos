defmodule CalculoSalarioNeto do
  @moduledoc """
  Módulo para calcular el salario neto de un empleado a partir de los datos ingresados
  mediante un formulario Java. Si el empleado trabaja más de 160 horas, las horas extra
  se pagan al 125%.
  """

  @doc """
  Función principal que solicita los datos del empleado, calcula el salario neto
  y muestra el resultado en pantalla.
  """
  def main do
    formulario(:texto)
    |> calcular_salario_neto()
    |> generar_mensaje()
    |> Util.mostrar_mensaje_java()
  end

  @doc """
  Calcula el salario neto a partir de una tupla con el nombre, horas trabajadas
  y valor por hora. Las horas extra (más de 160) se pagan al 125%.

  ## Ejemplo

      iex> CalculoSalarioNeto.calcular_salario_neto({"Juan", 170, 10.0})
      {"Juan", 1725.0}
  """
  defp calcular_salario_neto({nombre, horas_trabajadas, valor_por_hora}) do
    salario_base = horas_trabajadas * valor_por_hora
    horas_extra = max(horas_trabajadas - 160, 0)
    pago_extra = horas_extra * valor_por_hora * 0.25
    {nombre, salario_base + pago_extra}
  end

  @doc """
  Genera un mensaje con el nombre del empleado y el salario neto calculado.

  ## Ejemplo

      iex> CalculoSalarioNeto.generar_mensaje({"Juan", 1725.0})
      "El salario neto de Juan es: 1725.0"
  """
  defp generar_mensaje({nombre, salario_neto}) do
    "El salario neto de #{nombre} es: #{salario_neto}"
  end

  @doc """
  Llama al programa Java para capturar los datos del empleado mediante un formulario.
  Retorna una tupla con el nombre, horas trabajadas y valor por hora.
  """
  defp formulario(:texto) do
    # Llama al programa Java para ingresar texto y capturar la entrada
    case System.cmd("java", ["-cp", ".", "Formulario", "input"]) do
      {output, 0} ->
        [nombre, horas_str, valor_str] = String.split(String.trim(output), ",")
        horas_trabajadas = String.to_integer(horas_str)
        valor_por_hora = String.to_float(valor_str)
        {nombre, horas_trabajadas, valor_por_hora}

      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
        nil
    end
  end
end

CalculoSalarioNeto.main()
