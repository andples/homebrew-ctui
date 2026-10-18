class Ctui < Formula
  desc "Minimal terminal calendar and task list (TUI and CLI)"
  homepage "https://github.com/andples/ctui"
  version "0.2.2"
  license "MIT"

  # Prebuilt by .github/workflows/release.yml in andples/ctui; written by
  # scripts/release.sh, don't edit by hand.
  on_macos do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.2.2/ctui-aarch64-apple-darwin.tar.gz"
      sha256 "9063c209ace9ece7e29d7166363b81135aef05b8109048ee63f4cccaf88a5460"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.2.2/ctui-x86_64-apple-darwin.tar.gz"
      sha256 "89b17eb595f14066cac0481a96f8f48afda2513e6c520937c96e27006e317533"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/andples/ctui/releases/download/v0.2.2/ctui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bf9da9529950d3871d581c1faf675a01d7ede3fb47871574aac33ed9646d9075"
    end
    on_intel do
      url "https://github.com/andples/ctui/releases/download/v0.2.2/ctui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0f1561f6ad91186426aee1378dea069a850cbb803d74312e47031b4a62efdd86"
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
