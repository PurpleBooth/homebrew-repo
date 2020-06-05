class FixGnupgPermissions <Formula
desc "Fixes permissions problems on the gnupg directory"
homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/v0.16.0.tar.gz"
sha256 "3f2a6622556a051644de0425a94591d9fdb21424546a776dbad699fd7340cc26"

depends_on "rust" = >:build

def install
system "cargo", "install", "--locked", "--root", prefix, "--path", "."
end

test do
system "#{bin}/fix-gnupg-permissions", "-h"
system "#{bin}/fix-gnupg-permissions", "-V"
end
end
