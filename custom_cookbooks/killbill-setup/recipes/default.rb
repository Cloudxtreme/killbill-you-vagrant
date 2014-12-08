include_recipe "database::mysql"

# DB junk

mysql_connection_info = {:host => "localhost",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

mysql_database 'killbill' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'killbill' do 
	connection mysql_connection_info
	password 'killbill'
	action :create
end

mysql_database_user 'killbill' do 
	connection mysql_connection_info
	database_name 'killbill'
	password 'killbill'
	action :grant
end

# Install killbill DBs

bash "install_killbill_dbs" do
	user "root"
	cwd "/tmp"
	code <<-EOH
	curl http://killbill.io/wp-content/uploads/2014/11/killbill-0.12.0.ddl | mysql -h 127.0.0.1 -ukillbill -pkillbill killbill
	echo Installed killbill tables
	EOH
end