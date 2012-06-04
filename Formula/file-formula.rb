require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  url 'ftp://ftp.astron.com/pub/file/file-5.11.tar.gz'
  homepage 'http://www.darwinsys.com/file/'
  md5 '16a407bd66d6c7a832f3a5c0d609c27b'
  head 'git://github.com/glensc/file.git'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
