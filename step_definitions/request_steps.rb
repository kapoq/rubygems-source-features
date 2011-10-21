When /^I make a GET request to "([^"]*)"$/ do |path|
  get path
end

When /^I POST the gem package to "([^"]*)"$/ do |path|
  header "Content-Type", "application/octet-stream"
  post path, Gem.read_binary(File.join(TmpDirHelper.local_dir, @package_name))
end

When /^I POST a file that is not a valid gem package to "([^"]*)"$/ do |path|
  invalid_package = File.join(TmpDirHelper.local_dir, "invalid.gem")
  open(invalid_package, "w") { |f| f << "invalid package" }
  header "Content-Type", "application/octet-stream"
  post path, invalid_package
end

When /^I make a DELETE request to "([^"]*)" with gem_name "([^"]*)" and version "([^"]*)"$/ do |path, name, version|
  delete path, :gem_name => name, :version => version
end


When /^I make a DELETE request to "([^"]*)" with gem_name "([^"]*)", version "([^"]*)", and platform "([^"]*)"$/ do |path, name, version, platform|
  delete path, :gem_name => name, :version => version, :platform => platform
end
