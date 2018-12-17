# spaCex

A distributed NLP pipeline for Elixir using spaCy

## Installation

1. Clone repository:

```$ git clone https://github.com/anglus/spaCex.git```

2. Change directories and install dependencies: 

```$ cd spaCex```

```$ mix deps.get```

3. Add ErlPort to Python (Your Python library package directory may be different):

```$ sudo cp -r deps/erlport/priv/python2/erlport/ /usr/lib64/python3.5/site-packages/```

```$ sudo cp -r deps/erlport/priv/python3/erlport/ /usr/lib64/python3.5/site-packages/```

4. (Optional) Edit lib/spaCex.ex to change the number of workers:

```{:size, 6},```

5. Run application:

```$ mix run lib/run.exs```


