require 'formula'

class Im2a < Formula
  homepage 'https://github.com/tzvetkoff/im2a'
  url 'https://github.com/tzvetkoff/im2a/archive/v0.4.0.tar.gz'
  sha256 '088b3840f47993354ed248a45a57f8555fcb4e051912a57fb477448713e525f4'
  version '0.4.0'

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
