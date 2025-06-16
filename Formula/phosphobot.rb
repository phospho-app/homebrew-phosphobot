class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.47"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.47/phosphobot-0.3.47-arm64.bin"
      sha256 "dddcd28d403466c74873dfdd9cb2b5dcfc4ba87da4701ad2ee72c3e37ad7c59d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.47/phosphobot-0.3.47-x86_64.bin"
      sha256 "c7cd3524cca290e0b9b96c8ab1f558c3aee5dc22fc0fb5cb89460c83028c0d68"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.47-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
