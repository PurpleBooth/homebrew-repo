class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://codeberg.org/PurpleBooth/fast-conventional"
  url "https://codeberg.org/PurpleBooth/fast-conventional/archive/main.tar.gz"
  version "2.3.85"
  sha256 "5a3fda80d9bc0bf9335c1511532444616341b58575cb58bad910aa9b25ffb06e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-2.3.85"
    sha256 cellar: :any,                 ventura:      "8426981e4e016d37f14c77be800af969e89d8a611cac0d7c21647afa23720f44"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f69c8de23ddff7b0c6813273f80d88bff7dd038f529af3ed63dfb58cd98812b7"
  end

  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test
  depends_on "openssl@3"

  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Install completion
    generate_completions_from_executable(bin/"fast-conventional", "completion", shells: [:bash, :zsh, :fish])

    # Man pages
    output = Utils.safe_popen_read("help2man", "#{bin}/fast-conventional")
    (man1/"fast-conventional.1").write output
  end

  def caveats
    <<~EOS
      Update your git config to finish installation:
        $ git config --global alias.fci '-c "core.editor=fast-conventional editor" commit'
      To use it run
        $ git fci
      You may add any of the usual commit arguments
    EOS
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}/README.md\""
  end
end
