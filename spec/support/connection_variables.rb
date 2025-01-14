shared_context "connection variables" do

  # -- locations
  let!(:bnd) { FactoryBot.create(:location, lid: 'BND', name: 'Bendel') }
  let!(:paris) { FactoryBot.create(:location, lid: 'PAR', name: 'Paris') }
  let!(:ber) { FactoryBot.create(:location, lid: 'BER', name: 'Berlin') }

  let(:properties) do
    { exportData: { "metadata" => { "enabled" => "false" } } }
  end

  let!(:ch1) { FactoryBot.create(:channel, id: 4711, properties: properties) }
  let!(:ch2) { FactoryBot.create(:channel, id: 815, state: 'STARTED') }
  let!(:ch3) { FactoryBot.create(:channel, id: 816, properties: properties) }

  let!(:sg1) { FactoryBot.create(:software_group, name: "SW Group One") }
  let!(:sg2) { FactoryBot.create(:software_group, name: "SW Group Two") }

  let!(:host1) do
    FactoryBot.create(:host, 
      location_id: bnd.id,
      hostname: 'BNDIM4HC03',
      ipaddress: '192.0.2.11'
    )
  end
  let!(:host2) do
    FactoryBot.create(:host, 
      location_id: bnd.id,
      hostname: 'BNDICM01',
      ipaddress: '192.0.2.30'
    )
  end
  # -- software
  let!(:imedone) do
    FactoryBot.create(:software, location: bnd, vendor: 'Telekom')
  end
  let!(:orbis) do
    FactoryBot.create(:software, location: paris, vendor: 'Daedalus')
  end
  let!(:icm) do
    FactoryBot.create(:software, location: bnd, vendor: 'Draeger')
  end

  # -- software interfaces
  let!(:im4hc) do
    FactoryBot.create(:software_interface, 
      software: imedone, 
      name: 'IM4HC',
      host: host1,
    )
  end
  
  let!(:icmsst) do
    FactoryBot.create(:software_interface, 
      software: icm, 
      name: 'ICM SST',
    )
  end

  # -- interface connectors
  let!(:icmbarin) do
    FactoryBot.create(:interface_connector, 
      software_interface: im4hc, 
      name: 'ICM BAR in',
      type: 'RxConnector',
      url: 'tcp://192.0.2.11:13005'
    )
  end
  let!(:icmbarout) do
    FactoryBot.create(:interface_connector, 
      software_interface: icmsst, 
      name: 'ICM BAR out',
      type: 'TxConnector',
      url: 'tcp://192.0.2.1:3005'
    )
  end

  let!(:c1) do
    FactoryBot.create(:software_connection,
      location_id: bnd.id,
      source_connector: icmbarout,
      source_url: 'tcp://192.0.2.1:3005',
      destination_connector: icmbarin,
      destination_url: 'tcp://92.0.2.11:13005',
      channel_ids: [ch1.id, ch2.id]
    )
  end
  let!(:c2) do
    FactoryBot.create(:software_connection,
      location_id: ber.id,
      source_url: 'tcp://1.2.3.4:5555',
      destination_url: 'tcp://5.6.7.8:9999',
      channel_ids: [ch2.id]
    )
  end

  let!(:c3) do
    FactoryBot.create(:software_connection,
      location_id: ber.id,
      source_connector: icmbarout,
      source_url: 'tcp://192.0.2.1:3005',
      destination_url: 'tcp://5.6.7.8:9999',
      channel_ids: [ch2.id]
    )
  end

  let!(:c4) do
    FactoryBot.create(:software_connection,
      location_id: ber.id,
      source_url: 'tcp://1.2.3.4:5555',
      destination_connector: icmbarin,
      destination_url: 'tcp://92.0.2.11:13005',
      channel_ids: [ch3.id]
    )
  end

  
end
