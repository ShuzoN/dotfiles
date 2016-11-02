 " ---------------key bind --------------
 " 間違えやすい, 使わないバインドを無効化
 nmap <C-z> <Nop>
 nmap <C-b> <Nop>
 nmap <C-f> <Nop>
 nmap <C-j> <Down>
 nmap <C-k> <Up>
 nmap <C-h> <Nop>
 nmap <C-l> <Right>
 imap <C-j> <Nop>
 imap <C-k> <Nop>
 " imap <C-h> <Nop>
 imap <C-l> <Nop>
 nmap <C-n> <Nop>
 nmap <C-p> <Nop>
 nmap <C-c> <Nop>
 imap <C-c> <Nop>
 nmap <C-m> <Nop>
 nmap <C-\> <Nop>
 nmap <S-h> <Nop>
 nmap <S-l> <Nop>
 nmap Q <Nop>
 nmap <Space>c <Nop>
 nmap U <Nop>
 nmap ZQ <Nop>

 " コロンとセミコロンの入れ替え
 noremap ; :

 " enter で改行挿入
 nmap <CR> o<ESC>

 " 補完をSpace-cに当てる
 imap <C-c> <C-n><C-p>

 nmap <S-l> <C-]>
 nmap <S-h> <C-t>
 nmap <Space><S-l> :tjump<CR>

