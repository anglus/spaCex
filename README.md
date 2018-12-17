# spaCex

A distributed NLP pipeline for Elixir using spaCy

## Prerequisites

1. Python 3 

2. spaCy - NLP library for Python

```$ pip install -U spacy```

   -OR-

```$ conda install -c conda-forge spacy```

   You may also need to download an English language model:

```$ python -m spacy download en```

3. Elixir programming language (1.3.4 or greater) and the Mix build tool. [Instructions](https://elixir-lang.org/install.html) vary by operating system. 

## Installation

1. Clone repository:

```$ git clone https://github.com/anglus/spaCex.git```

2. Change directories and install dependencies: 

```$ cd spaCex```

```$ mix deps.get```

3. Add ErlPort to Python (Your Python library package directory may be different):

```$ sudo cp -r deps/erlport/priv/python2/erlport/ /usr/lib64/python3.5/site-packages/```

```$ sudo cp -r deps/erlport/priv/python3/erlport/ /usr/lib64/python3.5/site-packages/```

4. (Optional) Edit lib/spaCex.ex to change the number of workers (should probably be less than the number of CPU threads available to you):

```{:size, 6},```

5. (Optional) Use your own input data:

```$ cp /path/to/my_data.txt data/```

```$ vi lib/run.exs```

```# Input file
infile = "./data/my_data.txt"
```

6. Run application:

```$ mix run lib/run.exs```


