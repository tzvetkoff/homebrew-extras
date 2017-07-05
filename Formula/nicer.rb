require 'formula'

class Nicer < Formula
  url 'https://github.com/tzvetkoff/nicer/archive/v0.1.0.tar.gz'
  homepage 'http://github.com/tzvetkoff/nicer'
  sha256 'a808cbc912b6e83359be56a991d13dc29f31766f7150296ab6d1bb40ad1300a3'

  def install
    ENV.deparallelize
    system 'make nicer'
    bin.install 'nicer'
    man1.install 'nicer.1'
  end

  def caveats
    <<-EOS.undent
    You should manualy make the nicer binary `SUID` & `SGID`.

    $ sudo chown root:wheel #{bin/'nicer'}
    $ sudo chmod 6755 #{bin/'nicer'}
    EOS
  end
end
