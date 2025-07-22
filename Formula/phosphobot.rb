class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.72"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.72/phosphobot-0.3.72-arm64.bin"
      sha256 "29a27670d08fdaff6be3418d228138651e339152a43771058d0f78c9b11fd8b0"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.72/phosphobot-0.3.72-x86_64.bin"
      sha256 "ca58d85c1187c8240c7beb9e44c7139538a1d963e36a09d258bcbf2f63451c52"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.72-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
