class Gnfiles < Formula
  desc "Uses IPFS to exchange files between computers"
  homepage "https://github.com/gnames/gnfiles"
  url "https://github.com/gnames/gnfiles/archive/v0.0.1.tar.gz"
  sha256 "58f529a46604992a0e9af9f81b19269d0493113fa136acfe77411afe93e8322d"
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
