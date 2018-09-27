require 'formula'

class Fakesmtp < Formula
  homepage 'http://nilhcem.github.io/FakeSMTP/'
  url 'https://github.com/Nilhcem/FakeSMTP/archive/v2.0.tar.gz'
  sha256 '8cb623f32b55f814af43b731432eb14da80d95cb13059c79423265037cda9dfb'

  head 'https://github.com/Nilhcem/FakeSMTP/archive/master.tar.gz'

  depends_on 'maven'

  def install
    system 'mvn package -Dmaven.test.skip'

    script = <<~END
      #!/bin/bash

      if [[ ${EUID} != 0 ]]; then
        exec sudo ${BASH_SOURCE[0]} ${*}
      fi

      nohup -- java -jar `brew --prefix fakesmtp`/libexec/fakesmtp.jar ${*} --output-dir ${HOME}/FakeSMTP >/dev/null 2>&1 &
    END

    FileUtils.mkdir_p(libexec)
    FileUtils.cp(Dir['target/fake*.jar'].first, "#{libexec}/fakesmtp.jar")

    FileUtils.mkdir_p(bin)
    File.write("#{bin}/fakesmtp", script)
    File.chmod(0755, "#{bin}/fakesmtp")
  end

  def caveats
    <<~END
      FakeSMTP requires root privileges in order to bind port 25.
    END
  end
end
