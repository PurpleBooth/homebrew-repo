class ReadableNameGenerator < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/v2.100.10.tar.gz"
  sha256 "20de72ae94f8a5b409e29109309393f65db3895e3c1da983edadd54634ace68c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.10"
    sha256 cellar: :any_skip_relocation, big_sur:      "bc96ba6b57d1a7f14f36fd4420d3c08fdb70d99bace4ec874d57e14d6bd10d88"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "269aaadc9ae3ef2d9087f407f6cb0f24d7cfceadf2afd69edbd034be4d3905f1"
  end
  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "specdown/repo/specdown" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/readable-name-generator", "-h"
    system "#{bin}/readable-name-generator", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
