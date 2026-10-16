class Ctui < Formula
  desc "Minimal terminal calendar and task list (TUI and CLI)"
  homepage "https://github.com/andples/ctui"
  version "0.1.2"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/ctui; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.1.2/ctui-aarch64-apple-darwin.tar.gz"
      sha256 "45457b097568841596e3a67897a42c356597807177e0b02e9ba94524ac450a8c"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.1.2/ctui-x86_64-apple-darwin.tar.gz"
      sha256 "d78b105bb5364d9dd2faf0a5c9cdd1c230c33d66f022ea859d7ad542c9e6220a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.1.2/ctui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dd05ed26f29e690313b5f2efe975ff9cabbe0e28d955e8b21f4d0351ecdfb4c3"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.1.2/ctui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7ab2c9596244562154a9e13f69dfb700ccf73b67a3602a9808526ce413d7e666"
    end
  end

  head do
    url "https://github.com/andples/ctui.git", branch: "master"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "ctui"
    end
    # The Monkeytype themes (GPL-3.0, separate files); ctui finds them in
    # share/ctui/themes next to its own prefix.
    pkgshare.install "themes"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ctui --version")
  end
end
