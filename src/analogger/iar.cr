# This is an interactive analogger repl. It is a shell for interacting with Analogger manually.

require "fancyline"
require "./client"

# TODO add proper argument handling. This is gross.
if ARGV.size == 1
  host, p = ARGV[0].split(/:/,2)
  port = p.to_i
end

host ||= "127.0.0.1"
port = 47990 if port == 0 || port.nil?

if ARGV.size == 2
  service = ARGV[1]
else
  service = "stderr"
end

logger = Analogger::Client.new(service: service, host: host, port: port)

fancy = Fancyline.new
puts "Log format is:\nSEVERITY : MESSAGE\nPress ctrl-d or type 'exit' to exit logging shell."

colors = {
  "debug": :white,
  "info": :green,
  "warn": :cyan,
  "error": :yellow,
  "fatal": :light_red
}

fancy.display.add do |context, line, yielder|
  if line && line =~ /\b\s*:\s*/
    severity, msg = line.split(/:/,2)
    if severity != ""
      severity = colors.has_key?(severity) ?
        severity.colorize(colors[severity]) :
        severity.colorize(:white)
      msg = msg.colorize.mode(:bold)
      line = "#{severity}:#{msg}"
    end
  end
  yielder.call context, line
end

while input = fancy.readline("$ ")
  exit if input =~ /^\s*exit\s*$/

  severity, msg = input.split(/\b\s*:\s*\b/,2)
  if severity != "" && msg != ""
    puts "   ...>"
    logger.log(severity, msg)
  else
    puts "ERROR"
  end

end