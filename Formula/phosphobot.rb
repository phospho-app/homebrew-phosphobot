class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.28"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.28/phosphobot-0.3.28-arm64.bin"
      sha256 "f1c277b2f00d342b8206b424f3bd7e1c83e449b7f04ab4c36635976b3502b224"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.28/phosphobot-0.3.28-x86_64.bin"
      sha256 "4ef96324ad626486ad75c9e21e9dcf6d48ba9aeaebf751f22de74ac99dc09fe1"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.28-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
