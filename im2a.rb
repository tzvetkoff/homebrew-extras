require 'formula'

class Im2a < Formula
  homepage 'https://github.com/tzvetkoff/im2a'
  url 'https://github.com/tzvetkoff/im2a/archive/v0.6.0.tar.gz'
  sha256 '8e642c54ce4f7af3b25d733cfe6e59a16d81321489694d61e0e4e152707dc496'
  version '0.6.0'

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
