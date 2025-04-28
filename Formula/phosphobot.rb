class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.181"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.181/phosphobot-0.2.181-arm64.bin"
      sha256 "c5f2eaa151822b18b07f5084e67263610fa9d2fd32c1624bb058f7a3fef9bcaa"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.181/phosphobot-0.2.181-x86_64.bin"
      sha256 "316b6974e4a37388c325eadc3354cb7dfbe2f40df485e1f15e3836dbb56bb01d"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.181-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
