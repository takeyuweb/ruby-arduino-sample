# Arudino送受信サンプル
# Arduinoへのシリアルポート入力でLEDを付けたり消したりしつつカウンタ値を取得する。
#
# C:\Ruby22-x64\bin\ruby.exe -e $stdout.sync=true;$stderr.sync=true;load($0=ARGV.shift) C:/Users/Yuichi/IdeaProjects/Arduino/serialport_sample/readwrite_sample/readwrite_sample.rb
# "ON" or "OFF"
# INPUT> ON
# Turn on
# INPUT>
# (Output)Count : 1
# OFF
# Turn off
# INPUT> ON
# Turn on
# INPUT>
# (Output)Count : 2


require 'serialport'

port = 'COM3'
baud_rate = 9600

$stdout.sync = true

SerialPort.open(port, baud_rate) do |sp|
  Thread.new do
    Thread.pass
    sp.read_timeout = 10
    loop do
      begin
        puts  "\n(Output)" + sp.readline
      rescue EOFError
        retry
      end
    end
  end

  puts '"ON" or "OFF"'
  print 'INPUT> '
  while input = readline
    input.chomp!
    case input
      when 'ON'
        puts 'Turn on'
        sp.write '1'
      when 'OFF'
        puts 'Turn off'
        sp.write '0'
      else
        puts 'Invalid'
    end
    print 'INPUT> '
  end
end
