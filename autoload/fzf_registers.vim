" ============================================================================
" FileName: fzf_registers.vim
" Author: leoatchina
" GitHub: https://github.com/leoatchina
" ============================================================================
function! fzf_registers#registers()
    if has('nvim')
        let reg_lst = split(execute('registers'), '\n')
    else
        redir => reg
        silent registers
        redir END
        let reg_lst = split(reg, '\n')
    endif
    " cut head
    if reg_lst[0][0] ==# '"'
        let cut_head = 0
    else
        let cut_head = 1
    endif
    let lst = []
    for reg in reg_lst[1:]
        if cut_head > 0
            let reg = reg[6:]
        endif
        if reg[0] =~ '+'
            call insert(lst, reg, 0)
        elseif reg[0] =~ '*'
            call insert(lst, reg, 0)
        else
            call add(lst, reg)
        endif
    endfor
    return lst
endfunction

function! fzf_registers#paste_select(select) dict
    " NOTE: select[1] is the name of register
    let reg = a:select[0]
    if self.visual
        let cmd = 'gv"' . reg . self.paste
    else
        let cmd = '"' . reg . self.paste
    endif
    call feedkeys(cmd)
endfunction
