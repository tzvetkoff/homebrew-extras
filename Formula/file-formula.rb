require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.16.tar.gz'
  sha256 '48bcac7726c37a8a0bc7ffa16b58993575657dd7b382039380fb3b74ab389261'
  version '5.16'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
