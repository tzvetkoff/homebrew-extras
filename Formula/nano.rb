require 'formula'

class Nano < Formula
  url 'http://www.nano-editor.org/dist/v2.2/nano-2.2.6.tar.gz'
  homepage 'http://www.nano-editor.org/'
  sha256 'be68e133b5e81df41873d32c517b3e5950770c00fc5f4dd23810cd635abce67a'

  devel do
    url 'http://www.nano-editor.org/dist/v2.3/nano-2.3.4.tar.gz'
    sha256 '1774129f4b933df5dbfdf45c4ecdbfc19eb6ff8c2fc6ad43c7f392aa7cd998c1'
  end

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
