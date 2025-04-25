class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.172"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.172/phosphobot-0.2.172-arm64.bin"
      sha256 "b6a5e66cab476faab83441cd259dd15f3f46ebfb5b9a4321da077f529afac101"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.172/phosphobot-0.2.172-x86_64.bin"
      sha256 "11c8da3fa3354cd2ac22e49bcb2ced36271aac25b86d43376deb1839456d2c57"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.172-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
