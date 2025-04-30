class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.189"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.189/phosphobot-0.2.189-arm64.bin"
      sha256 "06a6e24641f0b21ac71f4940742351762031548b4af188b30d536061ebb3cbe4"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.189/phosphobot-0.2.189-x86_64.bin"
      sha256 "8126b2fe086f9ce44b7c35c1a14774c6070e1dd81787de9de03fba357065a1d6"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.189-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
