Because vim-airline(it was written on a plane) is 100% vimscript and a copy of something called powerline(should install this for i3 aswell) 
we have to rely on dependency to some of the same assets/glyphs as this powerline thing, in order to get nice looking , which basically just makes it look more awesome.

We get the patched font at:https://powerline.readthedocs.io/en/master/installation.html#patched-fonts 

which points us to a github profile: https://github.com/powerline/fonts  where they ACTUALLY(!!!!) have the Hack font, i also added a dir to this repository called hack_font_vim_airline


If i had to restore the ubuntu installation and by mistake installed the official fonts instead of the patched once compatible with vim-airline, then font-viewer
installs the fonts in:

~/.local/share/fonts

If they are not there, look in /usr/local/share/fonts/

Aparently the patched fonts have the exact same name as the original once, and i cannot overwrite the fonts through fontviewer, so i have to uninstall and then install again.

After installing fonts on ubuntu, we have to clear the font cache:

sudo fc-cache -f -v
