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
    # ENV.deparallelize  # if your formula fails when building in parallel
    # system "cmake", ".", *std_cmake_args
    # system "rm", "-f", "include/zconf.h", "include/zlib.h", "include/pnglibconf.h", "include/pngconf.h", "include/png.h"
    # system "rm", "-f", "lib/*.a"
    system "chmod", "+x", "#{buildpath}/bin/*"
    bin.install Dir["bin/*"]
    # system "chmod", "+x", "#{bin}/*"
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
