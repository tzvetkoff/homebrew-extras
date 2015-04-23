require 'formula'

# "File" is a reserved class name
class FileFormula < Formula
  homepage 'http://www.darwinsys.com/file/'
  url 'ftp://ftp.astron.com/pub/file/file-5.22.tar.gz'
  sha256 'c4e3a8e44cb888c5e4b476e738503e37fb9de3b25a38c143e214bfc12109fc0b'
  version '5.22'
  patch :DATA

  def install
    system './configure', "--prefix=#{prefix}",
                          '--disable-dependency-tracking',
                          '--enable-fsect-man5'
    system 'make install'
  end
end

__END__
diff -Naur file-5.20/src/file.h file-5.20+osxfix/src/file.h
--- file-5.20/src/file.h	2014-09-11 18:05:33.000000000 +0300
+++ file-5.20+osxfix/src/file.h	2014-11-03 14:57:26.000000000 +0200
@@ -68,6 +68,7 @@
 /* Do this here and now, because struct stat gets re-defined on solaris */
 #include <sys/stat.h>
 #include <stdarg.h>
+#include <xlocale.h>
 
 #define ENABLE_CONDITIONALS
 
