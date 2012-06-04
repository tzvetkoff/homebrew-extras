require 'formula'

class Nano < Formula
  url 'http://www.nano-editor.org/dist/v2.2/nano-2.2.6.tar.gz'
  homepage 'http://www.nano-editor.org/'
  md5 '03233ae480689a008eb98feb1b599807'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-nls",
                          "--disable-tiny",
                          "--enable-extra",
                          "--enable-browser",
                          "--enable-help",
                          "--disable-justify",
                          "--disable-mouse",
                          "--enable-tabcomp",
                          "--disable-wrapping-as-root",
                          "--enable-color",
                          "--enable-multibuffer",
                          "--enable-nanorc",
                          "--enable-utf8"
    system "make install"
  end
end
