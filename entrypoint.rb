#!/usr/bin/ruby
require 'fileutils'
CONFIG_PATH = "/root/.config/PeerCastStation/PecaSettings.xml"

pid = nil
Signal.trap(:TERM) do
  system("mono", "PeerCastStation.exe", "-kill")
  Process.wait pid
  system("cat", CONFIG_PATH)
  exit 0
end

Dir.chdir '/root/PeerCastStation-1.9.2'
xml = STDIN.read
unless xml.size == 0
  FileUtils.mkdir_p File.dirname(CONFIG_PATH)
  File.open(CONFIG_PATH, "w") do |settings|
    settings.write xml
  end
end
pid = spawn 'mono', 'PeerCastStation.exe'
Process.wait pid
