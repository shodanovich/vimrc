" отключить совместимость с vi, иначе будут недоступны расширенные возможности
set nocompatible
" отступ новой строки такой же, как у предыдущей
set autoindent
" использовать мышь во всех режимах
set mouse=a
" определение файла, плагины, отступы для определенных типов файлов
filetype plugin indent on
" включить синтаксическое выделение
syntax on
" нумерация строк
set number
" использовать пробелы вместо табуляций
set expandtab
" backup пишется, но не сохраняется после успешной записи
set nobackup
" не переносить строки - использовать при программировании
set nowrap
" при поиске выделять найденное по мере набора
set incsearch
" игнорировать заглавные буквы во время поиска
set ignorecase
" поиск чувствителен к регистру, только если в запросе есть загравные буквы
set smartcase
" показывать подходящую набираемую команду в последней строке экрана
set showcmd
" показывать режим редактора в последней строке
set showmode
" показывать соответствующие слова во время поиска
set showmatch
" история команд (по умолчанию 10)
set history=1000
" При автодополнении отображается список совпадений и дополнение до самого
" днинного общего символа
set wildmode=list:longest
" команды без переключения раскладки
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,фa,ыs,вd,аf,пg,рh,оj,лk,дl,яz,чx,сc,мv,иb,тn,ьm,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х\{,Ъ\},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<,Ю\>
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" Восстановление позиции курсора при повторном открытии
" не работает в табах, надо пользоваться '" в норм. режиме
set viewoptions=cursor,folds
au BufWinLeave * mkview
au BufWinEnter * loadview

" ширина табуляции, если тип файла не совпадает с распознанным
set shiftwidth=4
" такая же ширина при сдвигах блоков
set shiftround

" ******* mapping ********
" Ctrl-v - режим визуальный посимвольный
inoremap <C-v> <Esc>v
" манипуляции с выделенным фрагментом:
" удаление того, что выделено, с переходом в режим вставки
vnoremap <Del> <Del>i
" копирование выделенного фрагмента с переходом в режим вставки
" (далее по Ctrl-p можем вставить фрагмент)
vnoremap y yi
" перевести выделенный фрагмент в верхний регистр
vnoremap U Ui
" перевести выделенный фрагмент в нижний регистр
vnoremap u ui

" очистить строку 
inoremap <C-c> <Esc>ddO
" удалить строку из режима вставки
inoremap <C-d> <Esc>ddi
" удалить до конца строки
inoremap <C-Right> <Esc><Right>d$i
" удалить до конца слова
inoremap <C-S-Right> <Esc>dei
" Ctrl-y копируем строку в буфер
inoremap <C-y> <Esc>yyi
" **** Вставка строки (блока) с переходом в режим вставки ****
inoremap <C-p> <Esc>pi
" запись всех табов;
inoremap <C-w> <Esc>:wa<Enter>i
" выход из редактора (БЕЗ ЗАПИСИ!)
inoremap <C-q> <Esc>:qa!<Enter>
" отмена (режим вставки)
inoremap <C-u> <Esc>ui

" Ctrl-h: перевести текущее слово в верхний регистр
" расшифровка: l - сдвинуть курсор вправо, чтобы нейтрализовать 
" ошибку Vim (при переходе в нормальный режим курсор сдвигается влево);
" v - визуальный режим; iw - выделить слово; U - перевести его в верхний
" регистр; i - возврат в режим вставки
inoremap <C-h> <Esc>lviwUi
" Ctrl-l: перевести текущее слово в нижний регистр
inoremap <C-l> <Esc>lviwui

"Ctrl-f поиск из режима вставки
inoremap <C-f> <Esc>/

" F5 запуск текущего файла 
inoremap <F5> <Esc>:w<Enter>:source ~/.vim/ftplugin/run.vim<Enter>
nnoremap <F5> :w<Enter>:source ~/.vim/ftplugin/run.vim<Enter>
" Ctrl-F5 - запуск проекта
inoremap <C-F5>  <Esc>:wa<Enter>:source ~/.vim/ftplugin/runproject.vim<Enter>
nnoremap <C-F5>  :wa<Enter>:source ~/.vim/ftplugin/runproject.vim<Enter>

" переход в визуальный блочный режим
inoremap <C-b> <Esc><C-v>
" ****** вставка и отмена комментрия ********
" Вставка
" Переходим в визуальный блочный режим
" и выделяем строки стрелочками или весь абзац { -вниз, } - вверх
" вставляем комментарий и переходим в режим вставки
vnoremap <Ins> <Esc>:source ~/.vim/ftplugin/comment.vim<Enter>
" Отмена
" переходим снова в визуальный блочный режим по <C-v> и выделяем строки
" отменяем комментарий и возвращаемся в режим вставки
vnoremap <Del> <Del>i
" ****** сдвиг блока текста вправо-влево *******
" Переходим в визуальный блочный режим и выделяем блок
" > - сдвиг вправо, < - сдвиг влево c переходом в режим вставки
vnoremap > >i
vnoremap < <i

" NERDtree
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
call plug#end()
" включение-выключение NERDTree
inoremap <F2> <Esc>:NERDTreeToggle<CR>i
nnoremap <F2> :NERDTreeToggle<CR>i
