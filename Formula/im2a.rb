require 'formula'

class Im2a < Formula
  homepage 'https://github.com/tzvetkoff/im2a'
  url 'https://github.com/tzvetkoff/im2a/archive/v0.4.2.tar.gz'
  sha256 'f3204cac793d3be9f1e6b31f2d26abb1b25a130dc56df2d1d1321780b2d76e2f'
  version '0.4.2'

  head 'https://github.com/tzvetkoff/im2a/archive/master.tar.gz'

  depends_on 'imagemagick'
  depends_on 'pkg-config' => :build
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    system './bootstrap'
    system './configure', "--prefix=#{prefix}"
    system 'make install'
  end
end
