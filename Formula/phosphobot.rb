class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.118"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.118/phosphobot-0.3.118-arm64.bin"
      sha256 "c5f70b64475742abcef34f61b58930b63e0f85447db817aa592ea772d8aca92f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.118/phosphobot-0.3.118-x86_64.bin"
      sha256 "77d2a24d9189b195411b73a69fc3db15a3c03d87fe59c1880fe37bb3fb297a61"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.118-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
