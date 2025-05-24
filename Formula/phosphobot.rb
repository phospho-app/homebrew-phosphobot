class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.16"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.16/phosphobot-0.3.16-arm64.bin"
      sha256 "c8c3401649a66a10f0b1fceba644c3c31564594e3f27fd3317f4c758edb5e392"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.16/phosphobot-0.3.16-x86_64.bin"
      sha256 "d78d894a91182010affb6b47e555a572ef0d5a481a9ea42aa533cd172b367fdd"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.16-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
