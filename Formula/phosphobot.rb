class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.144"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.144/phosphobot-0.2.144-arm64.bin"
      sha256 "147d7fbdd9f8f2b1fe8c292a3f1f7d3a1157d69c095218f9ed57fb2095f2cf6e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.144/phosphobot-0.2.144-x86_64.bin"
      sha256 "3437079c0fd45fc6211702bb2fec2ca9814cc5894da36700c29b3f530ac93dad"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.144-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
