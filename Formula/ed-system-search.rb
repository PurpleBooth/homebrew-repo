class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.2.tar.gz"
  sha256 "3098f743889b9ef52db9105dbc89e4e9ee5509350f7c33478dc0e762b64dffad"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.2"
    sha256 cellar: :any_skip_relocation, catalina:     "74195c3e1800eba99fcefa096528c361bed59ec3c0921361245b07d94f1744db"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "881109a9a17164a785d8fecd0837ae1652731ca3ae44428434f497141568eaed"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
