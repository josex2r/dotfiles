if has('multi_byte')
  let g:SpiffyFoldtext_format = '%c{ }  %<%f{ }═╡ %4n lines ╞═%l{ }'
else
  let g:SpiffyFoldtext_format = '%c{ }  %<%f{ }=| %4n lines |=%l{ }'
endif
