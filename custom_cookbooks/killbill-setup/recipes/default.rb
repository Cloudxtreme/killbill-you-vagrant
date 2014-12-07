include_recipe "database::mysql"

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