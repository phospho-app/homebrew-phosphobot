class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.165"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.165/phosphobot-0.2.165-arm64.bin"
      sha256 "9eb014a2fb77bd1c1f62f4859d1cd88e0d2ceb226631512a8d28428a37bf3b4b"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.165/phosphobot-0.2.165-x86_64.bin"
      sha256 "e43fc3c2c8f12b582a22750903f8d9e344cb68c5e8551981412f9984aead51a1"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.165-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
