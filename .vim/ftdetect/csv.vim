autocmd filetypedetect BufRead,BufNewFile
      \ ?*.csv
      \,?*.dat
      \ setfiletype csv
