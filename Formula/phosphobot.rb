class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.95/phosphobot-arm64.bin"
      sha256 "3b2470873d7a9f396516815329442618d79b0360a7ddd39ff6474cd618cb0e57"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.95/phosphobot-x86_64.bin"
      sha256 "1708922fe43f2b0cc40e95fd2bed7ac1ee7720751ff73e89932f4529189344e5"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-arm64.bin" : "phosphobot-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
