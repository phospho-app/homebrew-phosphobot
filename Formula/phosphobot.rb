class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.145"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.145/phosphobot-0.2.145-arm64.bin"
      sha256 "150584f4b90237003fe0410c252533bad0aa5be67de15df3255109db34229b18"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.145/phosphobot-0.2.145-x86_64.bin"
      sha256 "027f27b51d735f4a217f70147d59f1ade8e55169578bfb018c1283794465b0ed"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.145-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
