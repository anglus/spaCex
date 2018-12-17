defmodule Run do
  # Case: result is an empty list - do nothing
  def write({:result, []}) do
    # no output if results are empty 
  end

  # Case: result list contains tuples - output as tab-separated strings
  def write({:result, entities}) do
    entities |> Enum.each((fn({ent_type, ent_text}) -> IO.puts ent_type <> "\t\t" <> ent_text end))
  end
end

# Input file
infile = "./data/spectrum_ai.txt"

# Starting point for application: pass input file path to Main module
Main.start infile
