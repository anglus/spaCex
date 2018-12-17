import spacy

# Performs named entity recognition (NER) on input text and extracts all
# ORG or PRODUCT entities in the text, sorted lexicographically. Multiple
# mentions of particular ORG or PRODUCT are collapsed to one instance if both
# mentions are identical. ("Nvidia" and "NVIDIA" would not be identical.)
#
# Input: byte_text - an Elixir string (bitstring) encoded as Python bytes
# Output: unique_entities - a list of (entity-type, entity-text) tuples

def tag(byte_text):
    text = byte_text.decode()    # Decode bytes to Python UTF-8 string
    nlp = spacy.load('en')
    doc = nlp(text)
    # Encode named entity label & text strings back into bytes (in a tuple) for
    # simpler integration with Elixir.
    entities = [(ent.label_.encode(), ent.text.encode()) for ent in doc.ents if ent.label_ is 'ORG' or ent.label_ is 'PRODUCT']
    unique_entities = list(sorted(set(entities)))
    return unique_entities
