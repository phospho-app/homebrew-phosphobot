class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.99"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.99/phosphobot-0.2.99-arm64.bin"
      sha256 "11afe9bc354370a51f9cd610854d23838ca12543bcb18e09487c5e7e18e81838"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.99/phosphobot-0.2.99-x86_64.bin"
      sha256 "18218af04ca83d7dee6ce99f70ceffb1c916ca49efa19f59394b7f46a125f86a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.99-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
