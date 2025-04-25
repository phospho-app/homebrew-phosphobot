class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.171"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.171/phosphobot-0.2.171-arm64.bin"
      sha256 "674e3df3b05fae5eb51bcf199185adc722effb72a0d7c188fab1f8c2fb12fafc"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.171/phosphobot-0.2.171-x86_64.bin"
      sha256 "862fafb443f88d2eb2ffcefc804ffdf4a63320bf36580470504dc8637bef29a1"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.171-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
