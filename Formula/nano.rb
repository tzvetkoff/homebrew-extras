require 'formula'

class Nano < Formula
  url 'http://www.nano-editor.org/dist/v2.5/nano-2.5.0.tar.gz'
  homepage 'http://www.nano-editor.org/'
  sha256 'ff323e6fef74caf0a924304841c07ac65ec30db99dc5c1f8272b4c536a5c89ee'

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
