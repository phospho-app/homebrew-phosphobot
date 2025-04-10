class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.124"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.124/phosphobot-0.2.124-arm64.bin"
      sha256 "5fb1ef93588d1837c8cc7bc1ecc005a81d8e5d839cccf7c15084e00b1ba34f9b"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.124/phosphobot-0.2.124-x86_64.bin"
      sha256 "e3e451c3d2a6cd1e9de174a7dd4c5e6f4db4255a944742d9ad88e5cb095294fe"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.124-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
