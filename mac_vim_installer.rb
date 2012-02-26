#!/usr/bin/env ruby
SOURCE_FILE = "vim-7.3.tar.bz2"
SOURCE_FOLD = "vim73/"

def download
  File.exist?(SOURCE_FILE) or system "curl ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2 > vim-7.3.tar.bz2" 
end

def install
  system "cd #{SOURCE_FOLD} && make clean && LDFLAGS=-L/usr/lib ./configure --enable-rubyinterp -enable--multibyte --with-features-huge  && make && make install"
end

def untar
  File.exists?(SOURCE_FOLD) or system "tar -xjvf vim-7.3.tar.bz2"
end

download &&  untar &&  install

