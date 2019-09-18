autocmd filetypedetect BufRead,BufNewFile
      \ Rakefile
      \,Capfile
      \,Gemfile
      \,.autotest
      \,.irbrc
      \,?*.treetop
      \,?*.tt
      \ setfiletype ruby
