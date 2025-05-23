class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.15"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.15/phosphobot-0.3.15-arm64.bin"
      sha256 "ae78d8ddfb68e2252f1d36ab9e67a07e1bd922fbebb2acc74c8819ffab256ced"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.15/phosphobot-0.3.15-x86_64.bin"
      sha256 "31c1c2a5d51ee3052ea69cc3b9bb705f0b11573b288563ef99b1f499e1f5c39a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.15-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
