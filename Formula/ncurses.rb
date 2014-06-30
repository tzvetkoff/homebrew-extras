require 'formula'

class Ncurses < Formula
  homepage 'http://www.gnu.org/s/ncurses/'
  url 'http://ftpmirror.gnu.org/ncurses/ncurses-5.9.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz'
  sha256 '9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b'

  option :universal

  def install
    ENV.universal_binary if build.universal?

    system './configure', '--disable-debug',
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          '--with-shared',
                          '--enable-widec',
                          '--with-manpage-format=normal',
                          '--enable-symlinks',
                          '--without-cxx-binding'
    system 'make'
    system 'make install'
  end
end
