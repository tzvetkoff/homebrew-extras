require 'formula'

class Nano < Formula
  url 'http://www.nano-editor.org/dist/v2.2/nano-2.2.6.tar.gz'
  homepage 'http://www.nano-editor.org/'
  sha256 'be68e133b5e81df41873d32c517b3e5950770c00fc5f4dd23810cd635abce67a'

  devel do
    url 'http://www.nano-editor.org/dist/v2.3/nano-2.3.6.tar.gz'
    sha256 'a74bf3f18b12c1c777ae737c0e463152439e381aba8720b4bc67449f36a09534'
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
