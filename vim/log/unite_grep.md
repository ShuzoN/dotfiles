### UniteにGrepを追加する

```sh
$ brew tap tkengo/highway
$ brew install highway
```

```diff
+ " grep検索
+ nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
+ 
+ " unite grepにhw(highway)を使う
+ if executable('hw')
+   let g:unite_source_grep_command = 'hw'
+   let g:unite_source_grep_default_opts = '--no-group --no-color'
+   let g:unite_source_grep_recursive_opt = ''
+ endif<Paste>
```
