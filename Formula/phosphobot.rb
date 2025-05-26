class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.18"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.18/phosphobot-0.3.18-arm64.bin"
      sha256 "d7ce38735c1ed9d60d64dbc2603e65d892afab35d046c470a2fdb6dfc2589adf"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.18/phosphobot-0.3.18-x86_64.bin"
      sha256 "ab7023cebc9b30d5dc4e06a633a711203af1e07e015f194a19965d2e4c2f4bd3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.18-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
