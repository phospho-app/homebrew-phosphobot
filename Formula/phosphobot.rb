class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.13"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.13/phosphobot-0.3.13-arm64.bin"
      sha256 "7f3dec89983c9a22417bde4bfe0dbcce735f05aba43ae4d8d0b07bce1bb62597"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.13/phosphobot-0.3.13-x86_64.bin"
      sha256 "8022b8d9af05c35e049ccd541c07762871ffab7fae456ce05c878c1040200cbd"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.13-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
