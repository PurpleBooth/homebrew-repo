class Gfmfmt < Formula
  desc "Format GitHub flavour markdown"
  homepage "https://github.com/PurpleBooth/gfmfmt"
  url "https://github.com/PurpleBooth/gfmfmt/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "6b8b75b13218ff4b43323d90f4c6d904cf11b086d1cb4b3d011cab0e138e2487"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/gfmfmt-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c876aa64051a6f65b7062f34e4d0ca7ec6cfdde76ea19932d88b3d7013260c44"
    sha256 cellar: :any_skip_relocation, ventura:      "5b6b7afed113041f7fa7c9116e9fb06ff670f318249291ae82a2dbba844ce184"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1ceef152137ac7790c0a2b4dc981267649399802c6ad836cd472ad8fae7ff9a2"
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
