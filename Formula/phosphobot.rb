class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.99"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.99/phosphobot-0.2.99-arm64.bin"
      sha256 "e0bf0c7bda0972e7f5d5c186845ffe16c6605276c7bd43bfb6c943ee54803467"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.99/phosphobot-0.2.99-x86_64.bin"
      sha256 "5de6f6e39ff79132f5fbf7fa9394c150b4021f316f546b265dcd6dc94dbbe5a0"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-0.2.99-arm64.bin" : "phosphobot-0.2.99-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
