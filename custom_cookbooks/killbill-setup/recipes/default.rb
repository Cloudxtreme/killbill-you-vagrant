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
	host '%'
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


bash "configure_catalina_properties" do
	user "root"
	cwd "/tmp"
	code <<-EOH
	echo ##tomcat_config >> /var/lib/tomcat7/conf/catalina.properties
	echo org.killbill.billing.osgi.dao.url: jdbc:mysql://127.0.0.1:3306/killbill >> /var/lib/tomcat7/conf/catalina.properties
	echo org.killbill.billing.osgi.dao.user: killbill >> /var/lib/tomcat7/conf/catalina.properties
	echo org.killbill.billing.osgi.dao.password: killbill >> /var/lib/tomcat7/conf/catalina.properties
	echo org.killbill.dao.url: jdbc:mysql://127.0.0.1:3306/killbill >> /var/lib/tomcat7/conf/catalina.properties
	echo org.killbill.dao.user: killbill >> /var/lib/tomcat7/conf/catalina.properties
	echo org.killbill.dao.password: killbill >> /var/lib/tomcat7/conf/catalina.properties
	EOH
	not_if 'grep -q "##tomcat_config" /var/lib/tomcat7/conf/catalina.properties'
end