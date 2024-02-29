class Dwca < Formula
  desc "A command line tool to work with Darwin Core Archives"
  homepage "https://github.com/gnames/dwca"
  url "https://github.com/gnames/dwca/archive/v0.1.0.tar.gz"
  sha256 ""
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", *std_go_args, "./dwca"
  end

  test do
    res = `#{bin}/dwca -V`
    assert_match /version/, res
  end
end
