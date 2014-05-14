require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.18.tar.gz'
  sha256 '6519fb706d583231c2419592ebecdbb21d33c62eaf7a1a0b24ddfcb80c08bf07'
  version '5.18'

  def install
    system './configure', '--disable-dependency-tracking',
                          "--prefix=#{prefix}"
    system 'make install'
  end
end
