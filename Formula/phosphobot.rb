class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.155"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.155/phosphobot-0.2.155-arm64.bin"
      sha256 "da9285ded865069eac75bf5ed7835684d0d08f7d63ad9b4719ce19efc837eb6e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.155/phosphobot-0.2.155-x86_64.bin"
      sha256 "3406b37987717738ec01fd2e45aded90c5c31811df7e632c657cc00f45c92858"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.155-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
