require 'formula'

class Im2a < Formula
  homepage 'https://github.com/tzvetkoff/im2a'
  url 'https://github.com/tzvetkoff/im2a/archive/v0.5.0.tar.gz'
  sha256 '514c1c3d8f519e3afbecfc39ac00e9b10fcf59f3c2b75df3a79e17d945a8398a'
  version '0.5.0'

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
