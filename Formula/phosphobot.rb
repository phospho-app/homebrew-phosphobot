class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.142"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.142/phosphobot-0.2.142-arm64.bin"
      sha256 "d273d75d4338029c7339945a1bb808a154fd97afd3d2de1ed092af315450591f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.142/phosphobot-0.2.142-x86_64.bin"
      sha256 "66d1066eefba4b7c691054ac8a18161907367868599073787e082b8fd44c15f3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.142-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
