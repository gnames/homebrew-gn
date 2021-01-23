class Gnparser < Formula
  desc "Breaks biodiversity scientific names into their elements"
  homepage "https://github.com/gnames/gnparser"
  url "https://github.com/gnames/gnparser/archive/v1.0.3.tar.gz"
  sha256 "37ac6b4c6a557e393829dacdff070184a3eadaf29c58ec3f8aaa2e21e48f9db3"
  license "MIT"

  depends_on "go" => :build

  def install
    man1.install "man/gnparser.1"
    system "go", "build", "-o", *std_go_args, "./gnparser"
  end

  test do
    res = `#{bin}/gnparser -f compact "Bubo bubo L."`
    assert_match /"simple":"Bubo bubo"/, res
  end
end
