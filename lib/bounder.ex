defmodule Bounder do
  # Naive sentence boundary detection: remove newlines and split sentences on
  # periods, question marks, and exclamation marks. Should be fine for this 
  # particular application, since we don't need the original text, and we 
  # probably don't need punctuation marks for NER (possible counterexample: 
  # Yahoo!). However, eventually this should be replaced with a more robust
  # algorithm or model.
  # 
  # Input: doc - a string representing a document.
  # Output: a list of strings representing sentences. 
  def split(doc) do
    String.replace(doc, "\n\n", " ")
    |> String.replace("\n", " ")
    |> String.split([". ", "? ", "! "])
  end
end
