require 'formula'

class Im2a < Formula
  homepage 'https://github.com/tzvetkoff/im2a'
  url 'https://github.com/tzvetkoff/im2a/archive/v0.3.0.tar.gz'
  sha256 '6aabc9a43870c9eccd355ada997b62b7564bdc8d33adee4b8aa1099c3f848934'
  version '0.3.0'

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
