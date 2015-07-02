require 'formula'

class Im2a < Formula
  homepage 'https://github.com/tzvetkoff/im2a'
  url 'https://github.com/tzvetkoff/im2a/archive/v0.2.0.tar.gz'
  sha256 '9ed2c07e707c8afc44e851aa7467d8f284d7100a01abb54c1ba549a7c8027732'
  version '0.2.0'

  head 'https://github.com/tzvetkoff/im2a/archive/master.tar.gz'

  depends_on 'autoconf'
  depends_on 'automake'
  depends_on 'pkg-config'
  depends_on 'imagemagick'

  def install
    system './bootstrap'
    system './configure', "--prefix=#{prefix}"
    system 'make install'
  end
end
