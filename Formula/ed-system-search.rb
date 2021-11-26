class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.8.tar.gz"
  sha256 "caccdcfdff132ce2216967f9d4e57b72808bfc6d10aa82e7097a821f897ab044"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.8"
    sha256 cellar: :any_skip_relocation, catalina:     "b51382a6446ce73882ea4ab099e8474212fcc08d417210e28b9e8203bf68214f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8b2009f738ba6fde9e6041b5caff305319963be6114e1b3dc1cba62d85a3fced"
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
