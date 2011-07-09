require 'formula'

# Gets the latest Gnu Screen with 256 support
# Method from:
# http://ryanwilliams.org/2010/Oct/09/gnu-screen-256-colours-mac-os-x and
# http://pjkh.com/articles/2008/07/09/osx-iterm-screen-vim-256-colors
class Screen <Formula
  head 'git://git.savannah.gnu.org/screen.git'
  homepage 'http://www.gnu.org/software/screen/'

  def install
    system "cd src && ./autogen.sh"
    system "cd src && ./configure --enable-locale --enable-telnet --enable-colors256 --enable-rxvt_osc --prefix=#{prefix}"
    system "cd src && make install"
  end

  def caveats
    <<-EOS
To configure your screen for 256 colors, include the following your your ~/.screenrc:

    #terminfo and termcap for nice 256 color terminal
    # allow bold colors - necessary for some reason
    attrcolor b ".I"
    # tell screen how to set colors. AB = background, AF=foreground
    termcapinfo xterm "Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm"
    termcapinfo xterm-color "Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm"
    # erase background with current bg color
    defbce "on"

    term screen-256color
    EOS
  end
end
