class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.25"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.25/phosphobot-0.3.25-arm64.bin"
      sha256 "b19e36a757bb7b7b1f428106c30472b6ae3016e9009203eea6c2b301dd030150"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.25/phosphobot-0.3.25-x86_64.bin"
      sha256 "61da0d22be01976a274cae53b033c74d07238a6262108a08732b99ab93495dc9"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.25-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
