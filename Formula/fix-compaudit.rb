class FixCompaudit <Formula
desc "Fixes problems reported by compuaudit"
homepage "https://github.com/PurpleBooth/fix-compaudit"
url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.14.0.tar.gz"
sha256 "edf002751ca3ce39b0519153ce29384b715cb9f4aaed22f5b42e6f182fe7ad38"

depends_on "rust" = >:build
depends_on "zsh"

def install
system "cargo", "install", "--locked", "--root", prefix, "--path", "."
end

test do
system "#{bin}/fix-compaudit", "-h"
system "#{bin}/fix-compaudit", "-V"
end
end
