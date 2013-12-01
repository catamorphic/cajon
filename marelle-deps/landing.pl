pkg(landing).

met(landing, _) :- exists_directory('containers/landing').

meet(landing, _) :- git_clone('git@github.com:catamorphic/catamorphic-marketing.git', 'containers/landing').

depends(landing, _, [git]).