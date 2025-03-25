class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.101"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.101/phosphobot-0.2.101-arm64.bin"
      sha256 "65b7949e209f0891c68c756508462635b63e52b7f121983921cba32f3fc9f414"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.101/phosphobot-0.2.101-x86_64.bin"
      sha256 "69d500885310130ed355ef1b9878665d6e7e7a27fcb5232676ef088144294609"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.101-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
