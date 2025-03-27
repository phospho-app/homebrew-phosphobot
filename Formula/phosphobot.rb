class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.105"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.105/phosphobot-0.2.105-arm64.bin"
      sha256 "a488981d88b606685922fd8846111796dd55f86063a80267573e3d2346d69d69"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.105/phosphobot-0.2.105-x86_64.bin"
      sha256 "ddabbcfe527cbfdba4965255493d52cd04399d061dba04e953950e41a41bc4d9"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.105-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
