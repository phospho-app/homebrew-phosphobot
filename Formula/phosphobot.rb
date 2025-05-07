class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.205"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.205/phosphobot-0.2.205-arm64.bin"
      sha256 "08de913f6dfc7fc86448e66fe1f70de69cb0f70686fdc25b37d4f728bd407bea"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.205/phosphobot-0.2.205-x86_64.bin"
      sha256 "1a887c9d7303dc1c52a5ad55502506293d8415d2398818290e07c9146f38e712"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.205-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
