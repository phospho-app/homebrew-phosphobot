class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.85/phosphobot-arm64.bin"
      sha256 "b0089f8fb18f4fb393123fb4c66832f208f720d9dce9bd77e27a9d692a547684"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.85/phosphobot-x86_64.bin"
      sha256 "780a0220bc392aa8ea43db6c7c47666d896f3ecc5a0c433b2d945ff7604fc319"
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
