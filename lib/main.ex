defmodule Main do
  @timeout 6000000

  # Input: infile - path to the input file
  # Output: each list of tuples is returned to the Run.write function of the
  #         main.exs script file.  
  def start(infile) do
    {:ok, doc} = File.read infile
    sents = Bounder.split doc

    # Pass each sentence to the workers with the parameters used by Python
    tasks = Enum.map(sents, fn(s) ->
      Task.async(fn -> :poolboy.transaction(:worker,
        &(GenServer.call(&1, {:ner, :tag, s})), @timeout)
      end)
    end)

    # Handle the output from the workers, pass it to Run.write
    Enum.each(tasks, fn(task) ->
      Task.await(task, @timeout)
      |> Run.write
    end)
  end

  # Potential replacement for Run.write 
  def output_result({:result, []}) do
    # no output if list of entity tuples is empty 
  end

  # Potential replacement for Run.write
  def output_result({:result, entities}) do
    entities
  end
end
