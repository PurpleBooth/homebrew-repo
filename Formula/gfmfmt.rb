class Gfmfmt < Formula
  desc "Format GitHub flavour markdown"
  homepage "https://github.com/PurpleBooth/gfmfmt"
  url "https://github.com/PurpleBooth/gfmfmt/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "73bec4420f82d64547532281c3aa72b0ee8d2ede824c61a08624c7b1979e299c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/gfmfmt-0.1.2"
    sha256 cellar: :any_skip_relocation, catalina:     "f129f7a7aee9e8a745c3e216ab02cb493db0395157825846250b409388db57c7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6885db47e1cf69c700e9ee16b5e40f4cffc159eab51ed85ab22eb4664f568942"
  end
  depends_on "bash"
  depends_on "pandoc"

  def install
    bin.install "gfmfmt"
  end

  test do
    (testpath/"Test.md").write <<~EOS
      Hello World
      ===========
    EOS

    system bin/"gfmfmt", testpath/"Test.md"

    assert_equal "# Hello World\n", (testpath/"Test.md").read
  end
end
