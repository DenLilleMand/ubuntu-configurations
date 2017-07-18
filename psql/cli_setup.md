#Guides and questions
http://www.craigkerstiens.com/2013/02/21/more-out-of-psql/
https://www.digitalocean.com/community/tutorials/how-to-customize-the-postgresql-prompt-with-psqlrc-on-ubuntu-14-04
https://superuser.com/questions/17433/to-have-vim-psqls-editor/17437


#Other things worth looking into:
http://pgcli.com/
https://github.com/vim-scripts/dbext.vim

#Install

(I don't remember if i added everything, but it should be possible to use the 3 above links 
or google the rest)

##.bashrc:
Important to change that psql use the nano editor by default:
export PAGER='vim -R -u ~/.vimrcpg -'
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
export PSQL_EDITOR=/usr/bin/vim 


##.psqlrc
The contents of this file can be found in the ```/psql/psqlrc``` file
Basically i just source my original .vimrc file, and then add a few lines that should add 
something spicy. as shown above, the PAGER environment variable then tells psql pager to use 
that config file instead of my .vimrc file.

##Syntax(Which i don't think i got)
I made a folder .vim/syntax/ and put in a dbout.vim file, can see the content
of that file inside of /psql/dbout.vim

##Autocomplete

Still missing that, maybe i will look at that vim-scripts/dbext.vim file.


##Color highlighting

Well... If you see in my psqlrc file i do have some highlighting using ANSI escape sequences,
but it seems pretty leakluster and not the same as in one of the tutorials i followed.
Colors in my terminal is in general pretty complicated aswell though, because i allready customized it so much.

#Usage
Whenever i am inside the psql terminal now and do a big select statement,
it will open that statement in vim, so you can easily search through it. 
When i do ```\e``` the editor command that is, it opens in vim.


#History
The history files ~/.psql_history (all history)
and ~/.psql_history-<database> (specific for a DB) are pretty awesome i think,
they could be used for something.


