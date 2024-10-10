defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    IO.puts("Quais os nomes dos reis e rainhas?")
    names = collect_names()
    result = process_names(names)
    print_result(result)
  end

  def collect_names do
    names = []
    loop_collect_names(names)
  end

  def loop_collect_names(names) do
    input = IO.gets("") |> String.trim()
    if input == "" do
      names
    else
      loop_collect_names(names ++ [input])
    end
  end

  def process_names(names) do
    acc = %{}
    result = process_each_name(names, acc, [])
    Enum.reverse(result)
  end

  def process_each_name([], _acc, result), do: result
  def process_each_name([name | rest], acc, result) do
    count = Map.get(acc, name, 0) + 1
    updated_acc = Map.put(acc, name, count)
    result = result ++ ["#{name} #{to_roman(count)}"]
    process_each_name(rest, updated_acc, result)
  end

  def print_result(result) do
    Enum.each(result, fn line -> IO.puts(line) end)
  end

  def to_roman(number) do
    case number do
      1 -> "I"
      2 -> "II"
      3 -> "III"
      4 -> "IV"
      5 -> "V"
    end
  end

end
