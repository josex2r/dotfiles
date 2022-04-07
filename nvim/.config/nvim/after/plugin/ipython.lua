-- Setting up a kernel:
--
-- 1. create a venv_path
-- 2. activate the venv
-- 3. Run "python -m ipykernel install --user --name 'kernel_name', this creates a kernel linked to the current venv
--
-- List kernels "jupyter kernelspec list"
-- Uninstall kernel "jupyter kernelspec Uninstall kernel_name"

vim.cmd([[
function! ConnectToQT()
  " Prompt kernel name
  let l:kernel_name = input('Enter the kernel name: ')

  " Start console
  call jobstart("jupyter qtconsole --style monokai --JupyterWidget.include_other_output=True " .. "--kernel " .. l:kernel_name)

  " Connect to the console
  " call ConnectToKernel()
endfunction

function! ConnectToKernel()
  " Prompt kernel name
  let l:kernel_name = input('Enter the kernel name: ')

  " Connect to the console
  call IPyConnect('--kernel', l:kernel_name, '--no-window', '--existing')
endfunction

let g:ipy_celldef = '^##' " regex for cell start and end

nmap <silent> <leader>jk :call ConnectToQT()<CR>
nmap <silent> <leader>jl :IPython --existing --no-window<CR>
nmap <silent> <leader>jc <Plug>(IPy-RunCell)
nmap <silent> <leader>ja <Plug>(IPy-RunAll)
]])
