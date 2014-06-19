require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.19.tar.gz'
  sha256 '9484b3bbda1acc7b13a4f71031a85ce10c77bd0ffec7226741a219ef587e3a7c'
  version '5.19'

  def install
    system './configure', '--disable-dependency-tracking',
                          "--prefix=#{prefix}"
    system 'make install'
  end
end
