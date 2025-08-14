class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.90"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.90/phosphobot-0.3.90-arm64.bin"
      sha256 "604d81bb68a05df5f6a61586432a725a4f9d48f67be532244951f7d8ef1c932e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.90/phosphobot-0.3.90-x86_64.bin"
      sha256 "0d7c9a278252449dd0a659880aa451bd2693cf8bbcdc7eb58471c40eaedae6a9"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.90-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
