require 'formula'

class Nano < Formula
  url 'http://www.nano-editor.org/dist/v2.4/nano-2.4.3.tar.gz'
  homepage 'http://www.nano-editor.org/'
  sha256 '32d627072b6026678e4f4095c047adec92ac7ec542dd6d91cf27f49b601768f2'

  devel do
    url 'http://www.nano-editor.org/dist/v2.3/nano-2.3.99pre3.tar.gz'
    sha256 '0bd01e049173bd1adee7fa012a0a90283a8de2bc643a0c1c32fb48ce16c9f4f4'
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
