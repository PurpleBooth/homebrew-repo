class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.16.tar.gz"
  sha256 "fcf905ecdbaa8dc99a58f9914948f82f154b30cb56f50b92e2b53b438d659cda"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.16"
    sha256 cellar: :any_skip_relocation, catalina:     "f8755daf230af34040e251e579c33216763d2458f9fb7e00fa6cd65e6d15d818"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4ec411f40f1520e1854604419a0be7be0c3c7a551eb373ad0d51888f00109302"
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
