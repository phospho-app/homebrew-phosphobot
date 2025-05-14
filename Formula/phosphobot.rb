class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.212"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.212/phosphobot-0.2.212-arm64.bin"
      sha256 "8331c3b8f932e8c92f21c583867aed78a9a5f8bf6838278cd5f1614baeb8c033"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.212/phosphobot-0.2.212-x86_64.bin"
      sha256 "89b836b10bf3bab499c94b4b22358e55c043079d39758f2a1d46ebb23a4472c2"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.212-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
