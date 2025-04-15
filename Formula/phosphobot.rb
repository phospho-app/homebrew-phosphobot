class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.141"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.141/phosphobot-0.2.141-arm64.bin"
      sha256 "dc1ca6271f7772f0da0efd4e13482d311314b1d707d058de8546171acbc9c40f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.141/phosphobot-0.2.141-x86_64.bin"
      sha256 "53dc31596b583f53678c51fbe6604337eea9aa196136e864fb7e205d7c7210d8"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.141-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
