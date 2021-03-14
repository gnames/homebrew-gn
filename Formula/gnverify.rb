class Gnverify < Formula
  desc "Verifies scientific names via exact and fuzzy matching"
  homepage "https://github.com/gnames/gnverify"
  url "https://github.com/gnames/gnverify/archive/v0.2.1.tar.gz"
  sha256 "e30ca350395f2af0938b7e37178ff293fc3cd52ea1db4e49b09d79cda1f1450d"
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
