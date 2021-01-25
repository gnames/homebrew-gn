class Gnverify < Formula
  desc "Verifies scientific names via exact and fuzzy matching."
  homepage "https://github.com/gnames/gnverify"
  url "https://github.com/gnames/gnverify/archive/v0.1.0.tar.gz"
  sha256 "f55cf40cdb47b8612c2edfba3e6f5a16bce5e9495f34d9858bf536ef052cf525"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", *std_go_args, "./gnverify"
  end

  test do
    res = `#{bin}/gnverify "Bubo bubo L."`
    assert_match /BestMatch,Exact,0,Bubo bubo L./, res
  end
end
