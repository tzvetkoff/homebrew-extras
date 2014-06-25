require 'formula'

class Fakesmtp < Formula
  skip_clean :all

  homepage 'http://nilhcem.github.io/FakeSMTP/'
  url 'https://github.com/Nilhcem/FakeSMTP/archive/v1.10.tar.gz'
  sha256 '45520478f132e805132694828e37c8a375bd086cdb92e46d837f2bae8d635277'

  head 'https://github.com/Nilhcem/FakeSMTP/archive/master.tar.gz'

  depends_on 'maven'

  def install
    system 'mvn package -Dmaven.test.skip'

    FileUtils.mkdir_p(libexec)
    FileUtils.cp Dir['target/fake*.jar'].first, "#{libexec}/fakesmtp.jar"

    FileUtils.mkdir_p(bin)
    File.write("#{bin}/fakesmtp", DATA.read)
    File.chmod(0755, "#{bin}/fakesmtp")
  end

  def caveats
    <<-END.undent
      FakeSMTP requires root privileges in order to bind port 25.
    END
  end
end

__END__
#!/bin/bash

if [[ ${EUID} != 0 ]]; then
  exec sudo ${BASH_SOURCE[0]} ${*}
fi

nohup -- java -jar `brew --prefix`/opt/fakesmtp/libexec/fakesmtp.jar ${*} --output-dir ${HOME}/FakeSMTP >/dev/null 2>&1 &
