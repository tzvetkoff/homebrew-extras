require 'formula'

class Nano < Formula
  url 'http://www.nano-editor.org/dist/v2.5/nano-2.5.3.tar.gz'
  homepage 'http://www.nano-editor.org/'
  sha256 'b2b060129b9feff2d4870d803a441178c96531de9aed144ec0b83bd63ccb12ee'

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
