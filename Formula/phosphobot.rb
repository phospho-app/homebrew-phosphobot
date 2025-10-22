class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.134"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.134/phosphobot-0.3.134-arm64.bin"
      sha256 "c453049aaeb8c7bdb82bc381283b1d7410b5720b50a503e3b5e0ca937a0415f3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.134/phosphobot-0.3.134-x86_64.bin"
      sha256 "180d590606c53a8cdf870fd41296551b8f49bfe4f8e18a2aa4489fed799ed253"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.134-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
