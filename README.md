1. Installation requirements
	- Python 2.7 and/or 3 (32 bit) with correct setup in PATH environment variable
	- Visual Studio
	- CMake (Make sure it's in your PATH environment variable)
	- 7-Zip
	- ConEmu

2. Installing Vim / GVim on Windows
	- Go to the Vim website to download Vim
	- Make sure to select a full installation
	- Make sure to install at the location C:\Users\phili\Vim
	- Inside \Vim, clear the contents of \Vim\vimfiles and create a directory called "bundle"
	- Cut and paste the directory "autoload" from \Vim\vim80 to \Vim\vimfiles
	- Use the _vimrc provided in the repository in \Vim

3. Setup Vundle
	- As long as you followed the previous steps exactly, Vundle should work out of the box.
	- If you are having trouble writing to temp files, you can change the TEMP and TMP
	  environment variables to C:\temp
	- To install the plugins in your _vimrc, run the command ":PluginInstall"
	- Reset your gvim window to see the changes
	- You might be getting a few errors regarding certain plugins that should be resolved
	  in the following steps

4. Setup Powerline
	- Inside your command line or bash, run the following command:
	  pip install --user git+git://github.com/Lokaltog/powerline
	- Go to https://github.com/Lokaltog/powerline-fonts and download the Inconsolata.otf file
	- Double click on the downloaded otf file and install it to windows
	- As long as you have the _vimrc from this repo, your powerline should now be working

5. Setup YouCompleteMe
	- Change directory to where YouCompleteMe is installed:
	  cd ~/Vim/vimfiles/bundle/YouCompleteMe
	- To install support for python and C-family languages, run:
	  python install.py --clang-completer
	- YouCompleteMe supports many other languages, but they need to be installed on your
	  computer. If they are installed, you can run:
      python install.py --all
	- You should now be all set

