require 'formula'

class Setsid < Formula
  url 'https://github.com/tzvetkoff/setsid-macosx/archive/v0.1.tar.gz'
  homepage 'http://github.com/tzvetkoff/setsid-macosx'
  sha256 'ff094dfbf02f2ca6c36585051e1b7ac9acfd1a48347971deb49e210fcf138c44'

  def install
    system 'make'
    bin.install 'setsid'
    man1.install 'setsid.1'
  end
end
