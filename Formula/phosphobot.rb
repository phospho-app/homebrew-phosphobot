class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.5"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.5/phosphobot-0.3.5-arm64.bin"
      sha256 "1199e4278994cfdd3e1a96439ff2bec2e50768ee044d75bd0583a790483e9ae1"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.5/phosphobot-0.3.5-x86_64.bin"
      sha256 "897ad5580f9d5d41bf08735909ae173443570817dbd8cba0ca479a7c871ae38c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.5-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
