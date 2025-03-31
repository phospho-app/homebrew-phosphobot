class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.109"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.109/phosphobot-0.2.109-arm64.bin"
      sha256 "942d8f2dc23f5ef0b8f504906a93abcb58cd90e7f10ec8ca77c7e933275865f0"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.109/phosphobot-0.2.109-x86_64.bin"
      sha256 "0cfffd5a8c03df4c9c7360835f731b404579e3b2a8ac1a93664ff48432f78b2c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.109-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
