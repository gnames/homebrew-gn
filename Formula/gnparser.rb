class Gnparser < Formula
  desc "Breaks biodiversity scientific names into their elements"
  homepage "https://github.com/gnames/gnparser"
  url "https://github.com/gnames/gnparser/archive/v1.0.3.tar.gz"
  sha256 "e7d1ad3785321fe7645fc0d0ab7de1454b54e79bf76337efaaad756d18050b92"
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
