# Arudino送信サンプル
# PCでの入力に基づいてLEDを付けたり消したりする

require 'arduino_firmata'

PORT = 'COM3'
LED_SOCKET = 13

arduino = ArduinoFirmata.connect(PORT)
arduino.pin_mode(LED_SOCKET, ArduinoFirmata::OUTPUT)

loop do
  puts '"ON" or "OFF"'
  print 'INPUT> '
  while input = readline
    input.chomp!
    case input
      when 'ON'
        puts 'Turn on'
        arduino.digital_write(LED_SOCKET, true)
      when 'OFF'
        puts 'Turn off'
        arduino.digital_write(LED_SOCKET, false)
      else
        puts 'Invalid'
    end
    print 'INPUT> '
  end
end
