require 'formula'

class Ncurses < Formula
  homepage 'http://www.gnu.org/s/ncurses/'
  url 'http://ftpmirror.gnu.org/ncurses/ncurses-6.0.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz'
  sha256 'f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260'

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
