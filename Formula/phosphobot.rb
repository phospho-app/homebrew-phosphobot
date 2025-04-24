class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.168"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.168/phosphobot-0.2.168-arm64.bin"
      sha256 "8161c91338ef09282588ce278384eea0549f6418db8ef6e5582e35709721387f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.168/phosphobot-0.2.168-x86_64.bin"
      sha256 "d236d653bc199b6844f36e33fa74953597cc85d36989e8d1910bf0cd0d98fed3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.168-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
