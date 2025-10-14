class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.133"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.133/phosphobot-0.3.133-arm64.bin"
      sha256 "da705acd11c5efca673c0e03a5bfc4adc0f94ddee242711151c2928d2b103752"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.133/phosphobot-0.3.133-x86_64.bin"
      sha256 "8d69743dbe50e47ab4db1b6c0c0a8f6ea5cbdde0b8c75a7575e50aea2e2e79e9"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.133-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
