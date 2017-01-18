# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Cc0 < Formula
  desc "C0 is a small safe subset of the C programming language, augmented with contracts, specifically developed for teaching the course 15-122 Principles of Imperative Computation at Carnegie Mellon University."
  homepage "http://c0.typesafety.net"
  url "http://c0.typesafety.net/dist/cc0-v0590-osx10.8.5-bin.tgz"
  sha256 "b80050248d06866b9ea02778c0e4455d49a0eaf5d62593e1d8f683267773311b"

  depends_on "libpng"
  depends_on "zlib"

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    mkdir "misc"
    mkdir "misc/include"
    mkdir "misc/lib"
    mv "include/zconf.h", "misc/include/zconf.h"
    mv "include/zlib.h", "misc/include/zlib.h"
    mv "include/png.h", "misc/include/png.h"
    mv "include/pngconf.h", "misc/include/pngconf.h"
    mv "include/pnglibconf.h", "misc/include/pnglibconf.h"
    mv Dir["lib/*.a"], "misc/lib"
    mv Dir["lib/*.dylib"], "misc/lib"
    mv Dir["lib/*.c"], "misc/lib"
    # mv "lib/lib", "misc/lib/lib"
    rm "bin/cc0"
    rm "bin/coin"
    rm "bin/coin-exec"
    rm "bin/codex"
    prefix.install Dir["*"]
    (bin/"cc0").write <<-EOS.undent
      #!/bin/sh
      $0.bin $*
    EOS
    (bin/"coin").write <<-EOS.undent
      #!/bin/sh
      $0.bin $*
    EOS
    (bin/"coin-exec").write <<-EOS.undent
      #!/bin/sh
      $0.bin $*
    EOS
    (bin/"codex").write <<-EOS.undent
      #!/bin/sh
      $0.bin $*
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test cc0-v`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/cc0" "-h"
  end
end
