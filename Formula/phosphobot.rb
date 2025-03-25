class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.100"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.100/phosphobot-0.2.100-arm64.bin"
      sha256 "78aa26d760f87e714c2a0990ab98a41330a34c2f77d30284104e0f69b47181c9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.100/phosphobot-0.2.100-x86_64.bin"
      sha256 "940c9e1c794bde637b15af41dd66d5e36f58147013ee7140bf10ea9ca8d0cd0c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.100-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
