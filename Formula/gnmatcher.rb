class Gnmatcher < Formula
  desc "Takes putative scientific names and matches them known names"
  homepage "https://github.com/gnames/gnmatcher"
  url "https://github.com/gnames/gnmatcher/archive/v0.5.5.tar.gz"
  sha256 "1a3336d826493fc101d887729845198d86d1240c253943bb68daae3c86fe923d"
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
