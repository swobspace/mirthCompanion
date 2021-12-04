# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConnectorComponent, type: :component do
  let(:yaml) { YAML.load_file(Rails.root.join('spec', 'fixtures', 'files', 'connectors.yaml')) }

  it 'renders tcpReceiver' do
    connector = Mirco::Connector.new(yaml['tcpReceiver'])
    render_inline(described_class.new(connector: connector))
    expect(rendered_component).to have_text('sourceConnector')
    expect(rendered_component).to have_text('enabled')
    expect(rendered_component).to have_text('TCP Listener')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'serverMode')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: 'true')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'reconnectInterval')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: '5000')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'keepConnectionOpen')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: 'true')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'listenerIP')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: '0.0.0.0')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'listenerPort')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: '5021')
  end

  it 'renders fileDispatcher' do
    connector = Mirco::Connector.new(yaml['fileDispatcher'])
    render_inline(described_class.new(connector: connector))
    expect(rendered_component).to have_text('HL7_ADT_TO_MARIS')
    expect(rendered_component).to have_text('enabled')
    expect(rendered_component).to have_text('File Writer')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'host')
    expect(rendered_component).to have_css('tr>td:nth-child(2)',
                                           text: 'D:/Mirth Connect/messages/transfer/HL7_ADT_MARIS_IN')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'scheme')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: 'FILE')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'outputPattern')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: 'adt_imedone_${message.messageId}.hl')
  end

  it 'renders vmDispatcher' do
    properties = { name: 'HL7_TO_SATURN' }
    FactoryBot.create(:channel, uid: 'db97d5d4-fd11-4f6a-b29c-aa006a853579',
                                properties: properties)

    connector = Mirco::Connector.new(yaml['vmDispatcher'])
    render_inline(described_class.new(connector: connector))
    expect(rendered_component).to have_text('HL7_ADT_TO_ORGACARD')
    expect(rendered_component).to have_text('enabled')
    expect(rendered_component).to have_text('Channel Writer')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'writeToChannel')
    expect(rendered_component).to have_css('tr>td:nth-child(2)>a', text: 'HL7_TO_SATURN')
  end

  it 'renders tcpDispatcher' do
    connector = Mirco::Connector.new(yaml['tcpDispatcher'])
    render_inline(described_class.new(connector: connector))
    expect(rendered_component).to have_text('HL7_ADT_TO_IXSERV')
    expect(rendered_component).to have_text('enabled')
    expect(rendered_component).to have_text('TCP Sender')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'remoteAddress')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: '192.0.2.80')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'remotePort')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: '8010')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'localAddress')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: '0.0.0.0')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'sendTimeout')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: '5000')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'responseTimeout')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: '30000')
    expect(rendered_component).to have_css('tr>td:nth-child(1)', text: 'keepConnectionOpen')
    expect(rendered_component).to have_css('tr>td:nth-child(2)', text: 'true')
  end
end
