module Adauth
    
    # Uses the administrator login to create a Net::LDAP object that can query the whole domain
    #
    # Called as:
    #    Adauth::AdminConnection.bind(username,password)
    class AdminConnection
        
        # Uses the administrator login to create a Net::LDAP object that can query the whole domain
        #
        # Called as:
        #    Adauth::AdminConnection.bind(username,password)
        def self.bind
            if Adauth.config.admin_user and Adauth.config.admin_password
                conn = Adauth::Connection.bind(Adauth.config.admin_user, Adauth.config.admin_password)
                if conn
                    return conn
                else
                    raise "admin_user and admin_password do not result in a succesful login"
                end
            else
                raise "Can not create Adauth::AdminConnection without admin_user and admin_password set in config"
            end
        end
    end
end