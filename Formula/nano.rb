require 'formula'

class Nano < Formula
  url 'http://www.nano-editor.org/dist/v2.5/nano-2.5.1.tar.gz'
  homepage 'http://www.nano-editor.org/'
  sha256 'e06fca01bf183f4d531aa65a28dffc0e2d10185239909eb3de797023f3453bde'

  depends_on 'ncurses'

  def install
    system './configure', '--disable-debug',
                          '--disable-dependency-tracking',
                          "--prefix=#{prefix}",
                          '--enable-nls',
                          '--disable-tiny',
                          '--enable-extra',
                          '--enable-browser',
                          '--enable-help',
                          '--disable-justify',
                          '--disable-mouse',
                          '--enable-tabcomp',
                          '--disable-wrapping-as-root',
                          '--enable-color',
                          '--enable-multibuffer',
                          '--enable-nanorc',
                          '--enable-utf8'
    system 'make install'
  end
end
