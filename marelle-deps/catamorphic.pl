pkg(catamorphic).

met(catamorphic, _) :- bash('vagrant status | grep -q "The VM is running."').

meet(catamorphic, _) :- bash('vagrant up').

depends(catamorphic, _, [landing]).