class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.202"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.202/phosphobot-0.2.202-arm64.bin"
      sha256 "d5e62675a03d513cf4f0085a278bd1ab9875a3c588c919adf4ac490ce6db78d1"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.202/phosphobot-0.2.202-x86_64.bin"
      sha256 "26e252611bcbb0caea0a2c5abde65b0d5e0ad97950c593834428fb627efda0f3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.202-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
