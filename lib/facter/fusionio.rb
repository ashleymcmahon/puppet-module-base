Facter.add("fusionio") do
  setcode do
    Facter::Util::Resolution.exec('ls /dev/fio* >/dev/null 2>&1 && echo true || echo false')
  end
end
