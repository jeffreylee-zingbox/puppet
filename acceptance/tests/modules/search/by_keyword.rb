test_name 'puppet module search should do exact keyword matches'

step 'Setup'
stub_forge_on(master)

step 'Search for a module by exact keyword'

on master, puppet("module search github") do
  assert_equal '', stderr
  assert_equal <<-STDOUT, stdout
Searching https://forge.puppetlabs.com ...
NAME               DESCRIPTION                    AUTHOR          KEYWORDS      
pmtacceptance-git  This is a dummy git module...  @pmtacceptance  git \e[0;32mgithub\e[0m    
  STDOUT
end

# FIXME: The Forge presently matches partial keywords.
# step 'Search for a module by partial keyword'
# on master, puppet("module search hub") do
#   assert_equal '', stderr
#   assert_equal <<-STDOUT, stdout
# Searching https://forge.puppetlabs.com ...
# No results found for 'hub'.
# STDOUT
# end
