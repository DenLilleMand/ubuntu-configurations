**LaTeX Compiler/Interpreter**
apt-get install latexmk (the library that "compiles" latex to pdf & other formats)

**PDF-editor with auto refresh**
Make sure that the pdf editor "evince" is installed, usually its installed by default, but its one 
of a few pdf viewers that refreshes automatically, which will be important when automating the LaTex workflow. 
The idea is to "watch" the <report_name>.tex whenever changes occur call latexmk:  latexmk -pdf <report_name>.tex,
which should update the pdf document everytime we write to the tex file then.

**Packages**
To install packages in latex we simply install them through the apt repository called texlive-*,
i personally installed it with sudo apt-get install texlive-full  which installs all of the packages at the same time.

**Vim integration**
The editor i currently use to write LaTeX is Vim, there is several latex plugins for vim,  the popular ones 
seem to be vim-latex, vimtex etc.  vim-latex seems to be kind of oldschool, most talked about and possibly on a decline support wise. But i simply didn't understand it when i installed it, so i installed vimtex instead(which has 5x as many github stars and is more lightweight(they say)). So install the vimtex plugin. 

**Some website with latex packages - cannot get a ctan application locally like NPM or whatever, but we can look up packages and 
either download them directly or install them via apt-get**
www.ctan.org

**tl;dr;**
So vim, vim plugin, pdf viewer, aptitude repositories etc. all play together in this LaTeX setup. 

