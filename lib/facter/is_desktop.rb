Facter.add("is_desktop") do
  setcode do
    ubuntu = system('dpkg -l ubuntu-desktop') 
    xubuntu = system('dpkg -l xubuntu-desktop') 
    bsd = system('/usr/sbin/pkg info xorg') 
    if(xubuntu || ubuntu || bsd)
	    true.to_s
    else
      false.to_s
    end
  end
end

