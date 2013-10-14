#
# Cookbook Name:: weighttp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "libev-devel"

localrepo_path = "#{Chef::Config[:file_cache_path]}/weighttp"
giturl = "https://github.com/lighttpd/weighttp.git"

git localrepo_path do
  repository giturl
  reference "master"
  action :sync
end

script "install_weighttp" do
  cwd localrepo_path
  interpreter "bash"
  user "root"
  code <<-EOH
./waf configure build install
EOH
end

