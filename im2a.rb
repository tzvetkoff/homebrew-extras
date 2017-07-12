require 'formula'

class Im2a < Formula
  homepage 'https://github.com/tzvetkoff/im2a'
  url 'https://github.com/tzvetkoff/im2a/archive/v0.5.1.tar.gz'
  sha256 '7662f6a76f6d308c0762e387d2be1a282280c3dc07f3c914e6b4081a357c0b34'
  version '0.5.1'

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
