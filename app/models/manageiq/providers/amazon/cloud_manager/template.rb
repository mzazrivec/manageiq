class ManageIQ::Providers::Amazon::CloudManager::Template < ManageIQ::Providers::CloudManager::Template
  def provider_object(connection = nil)
    connection ||= ext_management_system.connect
    connection.images[ems_ref]
  end

  def proxies4job(_job = nil)
    {
      :proxies => [MiqServer.my_server],
      :message => 'Perform SmartState Analysis on this Image'
    }
  end
end
