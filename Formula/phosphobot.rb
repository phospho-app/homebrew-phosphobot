class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.124"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.124/phosphobot-0.3.124-arm64.bin"
      sha256 "41789637deb975965d611642a36ad62432ef67a2706b11c0540b442dfbd67bcb"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.124/phosphobot-0.3.124-x86_64.bin"
      sha256 "6037cacd3b3c82ade5e44c26654a8ded48976962b90e3ba874e6a1aa1bd493cb"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.124-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
