# zsh-config

This is my zsh configuration.

file structure is: ~/.zshrc ~/.env ~/zsh/config ~/zsh/functions

You have to link zshprompt.py to every directory, which is controlled by git.

So do a "ln -sf ../zshprompt.py zshprompt.py", when zshprompt.py is in the upper directory and add a .gitignore with "zshprompt.py" in those directories, where you don't want to see the zshprompt.py.
