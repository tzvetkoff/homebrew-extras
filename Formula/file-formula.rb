require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.12.tar.gz'
  sha256 '199d0dab2e32814cbced8dc30d3d2d5b7e45587598160a2c401358b573273d22'
  version '5.12'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
