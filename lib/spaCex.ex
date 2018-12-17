defmodule SpaCex do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: SpaCex.Worker.start_link(arg1, arg2, arg3)
      # worker(SpaCex.Worker, [arg1, arg2, arg3]),
      :poolboy.child_spec(:worker, poolboy_config())
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SpaCex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Application-specific configuration for SpaCex workers: use at least six 
  # workers, and no more than six (for a machine with 8 threads).
  defp poolboy_config do
    [
      {:name, {:local, :worker}},
      {:worker_module, Worker},
      {:size, 6},
      {:max_overflow, 0}
    ]
  end
end
