class Gnverify < Formula
  desc "Verifies scientific names via exact and fuzzy matching"
  homepage "https://github.com/gnames/gnverify"
  url "https://github.com/gnames/gnverify/archive/v0.2.1.tar.gz"
  sha256 "5f60c6cc2c41bd4968b2ea046e2da8a0a07031ae20bb9634b08f90ecf0611757"
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
