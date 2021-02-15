class Gnmatcher < Formula
  desc "Takes putative scientific names and matches them known names"
  homepage "https://github.com/gnames/gnmatcher"
  url "https://github.com/gnames/gnmatcher/archive/v0.5.5.tar.gz"
  sha256 "54aed0bfd6f0d27e6b58b50270ea6a136910669a798dd5a8204b706d1506207c"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", *std_go_args, "./gnmatcher"
  end

  test do
    res = `#{bin}/gnmatcher -V`
    assert_match /version/, res
  end
end
