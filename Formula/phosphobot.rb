class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.4"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.4/phosphobot-0.3.4-arm64.bin"
      sha256 "8ee1322ac2d1000c56bd14a3b4951ed42652fa5e8d475993c8e4042629457d99"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.4/phosphobot-0.3.4-x86_64.bin"
      sha256 "0c95d0bdf901ac5f5573c691ace5c639a1b69c4d949900ace09715fe75fd44bf"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.4-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
