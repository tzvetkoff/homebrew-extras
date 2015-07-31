require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.24.tar.gz'
  sha256 '802cb3de2e49e88ef97cdcb52cd507a0f25458112752e398445cea102bc750ce'
  version '5.24'
  patch :DATA

  def install
    system './configure', "--prefix=#{prefix}",
                          '--disable-dependency-tracking',
                          '--enable-fsect-man5'
    system 'make install'
  end
end
