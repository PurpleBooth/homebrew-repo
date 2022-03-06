class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.1.0.tar.gz"
  sha256 "764b30c14047094970d0bd9bb87d8eeb588efe2e8dac81d3eec33fa69d0ff199"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.1.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "24af0f3eb0e035dc3dfa7a652cbf6d6c190918aeec34e62f249e28651d072e46"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5514ddf303e46afde7d1ac5d3445c1feed7330ced16113f6e0ff5710193a970e"
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
