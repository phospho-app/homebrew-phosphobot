class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.176"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.176/phosphobot-0.2.176-arm64.bin"
      sha256 "04cc435c351f37603378e2797171cbbaddd8d4ed020ec7afab32a7ad57e73fa3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.176/phosphobot-0.2.176-x86_64.bin"
      sha256 "d7eef6744fed44c346517c7f7a75acede34dcbccab02c60be75cfa2cc0322461"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.176-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
