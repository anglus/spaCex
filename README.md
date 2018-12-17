# spaCex

A distributed NLP pipeline for Elixir using spaCy

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `spaCex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:spaCex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `spaCex` is started before your application:

    ```elixir
    def application do
      [applications: [:spaCex]]
    end
    ```

