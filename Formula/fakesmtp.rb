require 'formula'

class Fakesmtp < Formula
  homepage 'http://nilhcem.github.io/FakeSMTP/'
  url 'https://github.com/Nilhcem/FakeSMTP/archive/v1.11.tar.gz'
  sha256 'c70ba758ccee5058bf5e484873d08f6c34eeed19c6a289913b1b477b7bff8676'

  head 'https://github.com/Nilhcem/FakeSMTP/archive/master.tar.gz'

  depends_on 'maven'

  def install
    system 'mvn package -Dmaven.test.skip'

    script = <<-END.undent
      #!/bin/bash

      if [[ ${EUID} != 0 ]]; then
        exec sudo ${BASH_SOURCE[0]} ${*}
      fi

      nohup -- java -Xdock:name="FakeSMTP" -jar `brew --prefix`/opt/fakesmtp/libexec/fakesmtp.jar ${*} --output-dir ${HOME}/FakeSMTP >/dev/null 2>&1 &
    END

    FileUtils.mkdir_p(libexec)
    FileUtils.cp Dir['target/fake*.jar'].first, "#{libexec}/fakesmtp.jar"

    FileUtils.mkdir_p(bin)
    File.write("#{bin}/fakesmtp", script)
    File.chmod(0755, "#{bin}/fakesmtp")
  end

  def caveats
    <<-END.undent
      FakeSMTP requires root privileges in order to bind port 25.
    END
  end
end
