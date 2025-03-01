class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.75/phosphobot.bin"
  sha256 "a6a2bf5e867ed55d72abfcba661d6456a69e092c3d7ccfe5414475765b26a8d0"
  license "MIT"

  def install
    chmod "+x", "phosphobot.bin"
    bin.install "phosphobot.bin" => "phosphobot"
  end

  test do
    system "#{bin}/phosphobot", "--version"
  end
end
