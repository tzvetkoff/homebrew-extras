require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.23.tar.gz'
  sha256 '2c8ab3ff143e2cdfb5ecee381752f80a79e0b4cfe9ca4cc6e1c3e5ec15e6157c'
  version '5.23'
  patch :DATA

  def install
    system './configure', "--prefix=#{prefix}",
                          '--disable-dependency-tracking',
                          '--enable-fsect-man5'
    system 'make install'
  end
end
