defmodule Worker do
  use GenServer

  # Start the generic server
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, [])
  end

  # Start a Python 3 process in a thread: use the file "ner.py" in lib/py/
  def init(_) do
    {:ok, python_pid} = :python.start([{:python, 'python3'},{:python_path, './lib/py/'},])
    #IO.puts("Started Python with PID: #{inspect python_pid}")
    state = [pid: python_pid]
    {:ok, state}
  end

  # Route a call to a running Python 3 process (class - :ner, fun - :tag)
  # This calls the tag function of lib/py/ner.py 
  def handle_call({class, fun, sent}, _from, state) do
    python_pid = state[:pid]
    #IO.puts "Process #{inspect self} performing NER on sentence: #{sent}"
    result = :python.call(python_pid, class, fun, [sent]) 
    {:reply, {:result, result}, state}
  end
end
