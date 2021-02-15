class Gnfiles < Formula
  desc "Uses IPFS to exchange files between computers"
  homepage "https://github.com/gnames/gnfiles"
  url "https://github.com/gnames/gnfiles/archive/v0.0.1.tar.gz"
  sha256 "54aed0bfd6f0d27e6b58b50270ea6a136910669a798dd5a8204b706d1506207c"
  license "MIT"

  depends_on "go" => :build

  def install
    man1.install "man/gnparser.1"
    system "go", "build", "-o", *std_go_args, "./gnfiles"
  end

  test do
    res = `#{bin}/gnparser -V`
    assert_match /version/, res
  end
end
