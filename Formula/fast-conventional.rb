class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://codeberg.org/PurpleBooth/fast-conventional"
  url "https://codeberg.org/PurpleBooth/fast-conventional/archive/main.tar.gz"
  version "2.3.110"
  sha256 "956805de694b2d2809ebb5833c563004b01bf3801e4ebeba9d04a06e77a89b6e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-2.3.110"
    sha256 cellar: :any,                 ventura:      "0a962e8547a82ca93abf5a64bec4b6e475d9ecf48a0f32e63977c42053a9d8fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "daff9bf0f478cf31968a5f9551662c9ab91951d9b0a11f0fd7d959682fbf9629"
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
