" Ale (Formatter & Linter):
"
" Format `js` files with Prettier
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'css': ['prettier'],
\ 'scss': ['prettier']
\ }

" Lint `js` files with eslint
let g:ale_linters = {
\ 'javascript': ['eslint']
\ }

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" Don't lint file directly on open
let g:ale_lint_on_enter = 0
" Disable linting on type
let g:ale_lint_on_text_changed = 'never'

" Format files on save
let g:ale_fix_on_save = 1

" Less agressive icons
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
