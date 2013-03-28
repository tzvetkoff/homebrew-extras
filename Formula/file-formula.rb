require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.14.tar.gz'
  sha256 '461ba01dd0900a3b7c2dcd901b04903192c07887a9c1928af0be507572c77fe4'
  version '5.14'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
