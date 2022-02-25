class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.15.tar.gz"
  sha256 "7b4d489b350586e188d643c211a5f189b3873ebc40f859f7d162d303e94df830"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.15"
    sha256 cellar: :any_skip_relocation, big_sur:      "d8bf3950c4f1a0932a01a4774ca82fa38334022eea44071c65606cec75bb8382"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "321d781b74221b78bf503d7a4b476fdb7dc1de52313f820df981687c30014a1b"
  end

  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
