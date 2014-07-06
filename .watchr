LINUX = RUBY_PLATFORM =~ /linux/i unless defined?(LINUX)

def escape(arg)
  arg.gsub(/\e\[..m?/, '')         # rid us of ansi escape sequences
     .gsub(/["`]/, "'")
     .gsub(/\r?\n/, "\\\\\\\\\\n")
end

def notify(pass, heading, body='')
  cmd = if LINUX
    %(notify-send --hint=int:transient:1 "#{escape heading}" "#{escape body[0..400]}")
  else
    if pass
      icon = ''
    else
      icon = '-contentImage /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertCautionIcon.icns'
    end
    %(terminal-notifier -message "#{escape body}" -title "#{escape heading}" #{icon})
  end
  system(cmd)
end

def run_specs(test, force=false)
  if force || File.exist?(test)
    puts "-" * 80
    rspec_cmd = "rspec --color --tty"
    puts "#{rspec_cmd} #{test}"
    cmd = IO.popen("#{rspec_cmd} #{test} 2>&1")
    result = ''
    until cmd.eof?
      char = cmd.getc
      result << char
      $stdout.write(char)
    end
    if result =~/.*0 failures/
      summary = $~.to_s
      secs = result.match(/Finished in ([\d\.]+)/)[1]
      notify(true, 'Test Success', summary + ' ' + secs)
    elsif result =~ /(\d+) failures?/
      summary = $~.to_s
      notify(false, 'Test Failure', summary)
    else
      notify(false, 'Test Error', 'One or more tests could not run due to error.')
    end
  else
    puts "#{test} does not exist."
  end
end

def run_suite
  run_specs('test/*', :force)
end

watch('^spec/(.*)_spec\.rb') { |m| run_specs("spec/#{m[1]}_spec.rb") }
watch('^lib/(.*)\.rb'      ) { |m| run_specs("spec/#{m[1]}_spec.rb") }
