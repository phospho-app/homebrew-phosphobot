class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.65"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.65/phosphobot-0.3.65-arm64.bin"
      sha256 "d99d8d54b0aa3f69a1cee187e58fdc8735f74d46abe77f01a912cc78aefac51c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.65/phosphobot-0.3.65-x86_64.bin"
      sha256 "c1d853c5aa1d63d83cad1524613d1687941df52f9adfd1e755d43b859486a362"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.65-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
