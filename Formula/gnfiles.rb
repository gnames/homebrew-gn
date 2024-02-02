class Gnfiles < Formula
  desc "Uses IPFS to exchange files between computers"
  homepage "https://github.com/gnames/gnfiles"
  url "https://github.com/gnames/gnfiles/archive/v0.0.1.tar.gz"
  sha256 ""
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", *std_go_args, "./gnfiles"
  end

  test do
    res = `#{bin}/gnfiles -V`
    assert_match /version/, res
  end
end
