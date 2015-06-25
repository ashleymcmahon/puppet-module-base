Facter.add("firmware_revision") do
  setcode do
    if Facter.value(:virtual) == "physical"
	Facter::Util::Resolution.exec('which dmidecode &> /dev/null && dmidecode | grep \'Firmware Revision\' | xargs | cut -d\' \' -f3  || echo unknown')
    else
        "virtual"
    end
  end
end
