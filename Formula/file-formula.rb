require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.25.tar.gz'
  sha256 '3735381563f69fb4239470b8c51b876a80425348b8285a7cded8b61d6b890eca'
  version '5.25'
  patch :DATA

  def install
    system './configure', "--prefix=#{prefix}",
                          '--disable-dependency-tracking',
                          '--enable-fsect-man5'
    system 'make install'
  end
end
