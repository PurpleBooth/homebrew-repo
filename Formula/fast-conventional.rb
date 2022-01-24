class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.8.tar.gz"
  sha256 "2ac51c0aa20f63191b1a9a2715fdb7cfddfd5b55c0a6e6c32f3697abd0cf0d9c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.8"
    sha256 cellar: :any_skip_relocation, big_sur:      "118391bf062630d5fa004a4b0456bf3435941afc97ebca7db8a8651601f87875"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "07bec8f56ca528a2acd8de843c7d4ab65529d8b9e81737f0384e6b29d7dc70ed"
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
