class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.73"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.73/phosphobot-0.3.73-arm64.bin"
      sha256 "d858724d522e13bc3701666b99d5433a8fdcf32c4052ef1d2e623682f3faf331"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.73/phosphobot-0.3.73-x86_64.bin"
      sha256 "6d5d91bfa5b302320bac2f8b1300ddbb6286aa89268c39e30eedfe051e4bbb20"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.73-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
