" ============================================================================
" FileName: fzf-registers
" Author: leoatchina
" GitHub: https://github.com/leoatchina
" ============================================================================

command! -range FZFRegisterPaste call fzf#run(extend({
        \ 'source': fzf_registers#registers(),
        \ 'sink': function('fzf_registers#paste_select', {'paste': 'P', 'visual': 0}),
        \ 'options': '--ansi -x --prompt "Paste>"'
        \ }, g:fzf_layout), 0)
command! -range FZFRegisterAppend call fzf#run(extend({
        \ 'source': fzf_registers#registers(),
        \ 'sink': function('fzf_registers#paste_select', {'paste': 'p', 'visual': 0}),
        \ 'options': '--ansi -x --prompt "Append>"'
        \ }, g:fzf_layout), 0)
command! -range FZFRegisterPasteV call fzf#run(extend({
        \ 'source': fzf_registers#registers(),
        \ 'sink': function('fzf_registers#paste_select', {'paste': 'P', 'visual': 1}),
        \ 'options': '--ansi -x --prompt "Paste>"'
        \ }, g:fzf_layout), 0)
command! -range FZFRegisterAppendV call fzf#run(extend({
        \ 'source': fzf_registers#registers(),
        \ 'sink': function('fzf_registers#paste_select', {'paste': 'p', 'visual': 1}),
        \ 'options': '--ansi -x --prompt "Append>"'
        \ }, g:fzf_layout), 0)
