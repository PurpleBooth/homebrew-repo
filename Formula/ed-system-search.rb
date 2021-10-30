class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.4.tar.gz"
  sha256 "7d72c6c4e6d298268a23604e155849752fd2e3f2bd866d56914f248709106ba7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.4"
    sha256 cellar: :any_skip_relocation, catalina:     "530c216a8e05dcde29c3c09dc8674d7d78f26652cf1ebf69f2534e846275302c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e0b4362199948c5c33fff75fcd377596d288de51018cdb5ac829e7bb140dd1c3"
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
