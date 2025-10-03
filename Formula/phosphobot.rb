class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.129"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.129/phosphobot-0.3.129-arm64.bin"
      sha256 "666b5aff4b4273ad303842e488e18103ca9bcee71f17ecd05784de0aaf01798f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.129/phosphobot-0.3.129-x86_64.bin"
      sha256 "f09067972abad8f8ccb54514d6b2a13f3b158f50fb202e3d98204acfd561b3fb"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.129-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
