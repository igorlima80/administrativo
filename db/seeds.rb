puts "Menu..."
MenuItem.delete_all
MenuItem.create name: 'Unidades', icon: 'building', link: 'units_path', position: 1, target: '_self', permission: 'manage', permission_check: 'Unit', menu_item_id: nil, active_test: 'units', published: true
MenuItem.create name: 'Lançamentos', icon: 'money-bill-wave', link: 'unit_entries_path(unit_id: params[:unit_id] || 1)', position: 2, target: '_self', permission: 'read', permission_check: 'Entry', menu_item_id: nil, active_test: 'entries', published: true
MenuItem.create name: 'Estoque', icon: 'chart-bar', link: 'unit_lots_path(unit_id: params[:unit_id] || 1)', position: 3, target: '_self', permission: 'read', permission_check: 'Lot', menu_item_id: nil, active_test: 'lots', published: true
MenuItem.create name: 'Pedidos', icon: 'truck', link: 'orders_path', position: 4, target: '_self', permission: 'read', permission_check: 'Order', menu_item_id: nil, active_test: 'orders', published: true
MenuItem.create name: 'Ordens de Serviço', icon: 'edit', link: 'unit_contracts_path(unit_id: params[:unit_id] || 1)', position: 5, target: '_self', permission: 'read', permission_check: 'Contract', menu_item_id: nil, active_test: 'contracts', published: true
MenuItem.create name: 'Categorias', icon: 'shopping-basket', link: 'categories_path', position: 6, target: '_self', permission: 'manage', permission_check: 'Category', menu_item_id: nil, active_test: 'categories', published: true
MenuItem.create name: 'Produtos', icon: 'shopping-bag', link: 'products_path', position: 7, target: '_self', permission: 'manage', permission_check: 'Product', menu_item_id: nil, active_test: 'products', published: true
MenuItem.create name: 'Serviços', icon: 'chart-bar', link: 'tasks_path', position: 8, target: '_self', permission: 'manage', permission_check: 'Task', menu_item_id: nil, active_test: 'tasks', published: true
MenuItem.create name: 'Fornecedores', icon: 'industry', link: 'providers_path', position: 9, target: '_self', permission: 'manage', permission_check: 'Provider', menu_item_id: nil, active_test: 'providers', published: true
MenuItem.create name: 'Cotações', icon: 'gavel', link: 'biddings_path', position: 10, target: '_self', permission: 'manage', permission_check: 'Bidding', menu_item_id: nil, active_test: 'biddings', published: true

admin = MenuItem.create name: 'Admin', icon: 'bars', link: '#', position: 99, target: '_self', permission: 'manage', permission_check: 'all', menu_item_id: nil, active_test: nil, published: true
MenuItem.create name: 'Usuários', icon: 'bars', link: 'users_path', position: 1, target: '_self', permission: 'manage', permission_check: 'User', menu_item: admin, active_test: 'users', published: true
MenuItem.create name: 'Estados', icon: 'bars', link: 'states_path', position: 2, target: '_self', permission: 'manage', permission_check: 'State', menu_item: admin, active_test: 'states', published: true
MenuItem.create name: 'Cidades', icon: 'bars', link: 'cities_path', position: 3, target: '_self', permission: 'manage', permission_check: 'City', menu_item: admin, active_test: 'cities', published: true
MenuItem.create name: 'Tipos de Documento', icon: 'bars', link: 'document_types_path', position: 4, target: '_self', permission: 'manage', permission_check: 'DocumentType', menu_item: admin, active_test: 'document_types', published: true
MenuItem.create name: 'Tipos de Telefone', icon: 'bars', link: 'phone_types_path', position: 5, target: '_self', permission: 'manage', permission_check: 'PhoneType', menu_item: admin, active_test: 'phone_types', published: true
MenuItem.create name: 'Bancos', icon: 'bars', link: 'banks_path', position: 6, target: '_self', permission: 'manage', permission_check: 'Bank', menu_item: admin, active_test: 'banks', published: true
MenuItem.create name: 'Tipos de Contas', icon: 'bars', link: 'bank_account_types_path', position: 7, target: '_self', permission: 'manage', permission_check: 'BankAccount', menu_item: admin, active_test: 'bank_account_types', published: true
MenuItem.create name: 'Perfis', icon: 'bars', link: 'profiles_path', position: 98, target: '_self', permission: 'manage', permission_check: 'Profile', menu_item: admin, active_test: 'Profile', published: true
MenuItem.create name: 'Menu', icon: 'bars', link: 'menu_items_path', position: 99, target: '_self', permission: 'manage', permission_check: 'MenuItem', menu_item: admin, active_test: 'menu_items', published: true

puts "Tipos de telefone..."
PhoneType.delete_all
PhoneType.create!(name: 'Celular')
PhoneType.create!(name: 'Residencial')
PhoneType.create!(name: 'Empresarial')

puts "Tipos de documentos..."
DocumentType.delete_all
DocumentType.create!(name: "Carteira de Trabalho e Prev. Social", code: "CTPS")
DocumentType.create!(name: "Registro Geral", code: "RG")
DocumentType.create!(name: "Passaporte", code: "PASS")
DocumentType.create!(name: "Título de Eleitor", code: "TE")
DocumentType.create!(name: "Certificado de Reservista", code: "CR")
DocumentType.create!(name: "Carteira de Motorista", code: "CM")
DocumentType.create!(name: "Ordem dos Advogados do Brasil", code: "OAB")
DocumentType.create!(name: "Cons. Reg. de Engenharia e Arquitetura", code: "CREA")
DocumentType.create!(name: "Associação Brasileira de Imprensa", code: "ABI")
DocumentType.create!(name: "Conselho Regional de Farmácia", code: "CRF")
DocumentType.create!(name: "Conselho Regional de Medicina", code: "CRM")
DocumentType.create!(name: "Conselho Regional de Odontologia", code: "CRO")
DocumentType.create!(name: "Conselho Regional de Administração", code: "CRA")
DocumentType.create!(name: "Conselho Regional de Contabilidade", code: "CRC")
DocumentType.create!(name: "Inscrição Estadual", code: "IE")
DocumentType.create!(name: "Matrícula Funcional", code: "MATR")
DocumentType.create!(name: "Gabinete de Identificação Policial", code: "GIP")
DocumentType.create!(name: "Certidão de Casamento", code: "CCA")
DocumentType.create!(name: "Certidão de Óbito", code: "CO")
DocumentType.create!(name: "Certidão de Nascimento", code: "CN")
DocumentType.create!(name: "Certidão da Dívida Ativa", code: "CDA")
DocumentType.create!(name: "Registro individual do cidadão", code: "RIC")
DocumentType.create!(name: "Número do programa de integração social", code: "PIS_PASEP")
DocumentType.create!(name: "Cadastro especifico do INSS", code: "INSS")
DocumentType.create!(name: "Número do identificação do trabalho", code: "NIT")

puts "Cidades e Estados..."
require 'net/http'
require 'json'

City.delete_all
State.delete_all
http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
states = JSON.parse http.get('/celsodantas/br_populate/master/states.json').body

states.each do |state|
  state_obj = State.create(name: state["name"], code: state["acronym"], ibgeid: state["code"])
  state_obj.save

  state["cities"].each do |city|
    City.create(name: city["name"], state: state_obj, ibgeid: city["code"])
  end
end

puts "Criando Bancos...\n"
Bank.delete_all
Bank.create(code: '654', name: 'Banco A.J.Renner S.A.')
Bank.create(code: '246', name: 'Banco ABC Brasil S.A.')
Bank.create(code: '025', name: 'Banco Alfa S.A.')
Bank.create(code: '641', name: 'Banco Alvorada S.A.')
Bank.create(code: '213', name: 'Banco Arbi S.A.')
Bank.create(code: '019', name: 'Banco Azteca do Brasil S.A.')
Bank.create(code: '029', name: 'Banco Banerj S.A.')
Bank.create(code: '000', name: 'Banco Bankpar S.A.')
Bank.create(code: '740', name: 'Banco Barclays S.A.')
Bank.create(code: '107', name: 'Banco BBM S.A.')
Bank.create(code: '031', name: 'Banco Beg S.A.')
Bank.create(code: '739', name: 'Banco BGN S.A.')
Bank.create(code: '096', name: 'Banco BM&F de Serviços de Liquidação e Custódia S.A')
Bank.create(code: '318', name: 'Banco BMG S.A.')
Bank.create(code: '752', name: 'Banco BNP Paribas Brasil S.A.')
Bank.create(code: '248', name: 'Banco Boavista Interatlântico S.A.')
Bank.create(code: '218', name: 'Banco Bonsucesso S.A.')
Bank.create(code: '065', name: 'Banco Bracce S.A.')
Bank.create(code: '036', name: 'Banco Bradesco BBI S.A.')
Bank.create(code: '204', name: 'Banco Bradesco Cartões S.A.')
Bank.create(code: '394', name: 'Banco Bradesco Financiamentos S.A.')
Bank.create(code: '237', name: 'Banco Bradesco S.A.')
Bank.create(code: '225', name: 'Banco Brascan S.A.')
Bank.create(code: 'M15', name: 'Banco BRJ S.A.')
Bank.create(code: '208', name: 'Banco BTG Pactual S.A.')
Bank.create(code: '044', name: 'Banco BVA S.A.')
Bank.create(code: '263', name: 'Banco Cacique S.A.')
Bank.create(code: '473', name: 'Banco Caixa Geral - Brasil S.A.')
Bank.create(code: '412', name: 'Banco Capital S.A.')
Bank.create(code: '040', name: 'Banco Cargill S.A.')
Bank.create(code: '745', name: 'Banco Citibank S.A.')
Bank.create(code: 'M08', name: 'Banco Citicard S.A.')
Bank.create(code: '241', name: 'Banco Clássico S.A.')
Bank.create(code: 'M19', name: 'Banco CNH Capital S.A.')
Bank.create(code: '215', name: 'Banco Comercial e de Investimento Sudameris S.A.')
Bank.create(code: '756', name: 'Banco Cooperativo do Brasil S.A. - BANCOOB')
Bank.create(code: '748', name: 'Banco Cooperativo Sicredi S.A.')
Bank.create(code: '075', name: 'Banco CR2 S.A.')
Bank.create(code: '721', name: 'Banco Credibel S.A.')
Bank.create(code: '222', name: 'Banco Credit Agricole Brasil S.A.')
Bank.create(code: '505', name: 'Banco Credit Suisse (Brasil) S.A.')
Bank.create(code: '229', name: 'Banco Cruzeiro do Sul S.A.')
Bank.create(code: '266', name: 'Banco Cédula S.A.')
Bank.create(code: '003', name: 'Banco da Amazônia S.A.')
Bank.create(code: '083-3', name: 'Banco da China Brasil S.A.')
Bank.create(code: 'M21', name: 'Banco Daimlerchrysler S.A.')
Bank.create(code: '707', name: 'Banco Daycoval S.A.')
Bank.create(code: '300', name: 'Banco de La Nacion Argentina')
Bank.create(code: '495', name: 'Banco de La Provincia de Buenos Aires')
Bank.create(code: '494', name: 'Banco de La Republica Oriental del Uruguay')
Bank.create(code: 'M06', name: 'Banco de Lage Landen Brasil S.A.')
Bank.create(code: '024', name: 'Banco de Pernambuco S.A. - BANDEPE')
Bank.create(code: '456', name: 'Banco de Tokyo-Mitsubishi UFJ Brasil S.A.')
Bank.create(code: '214', name: 'Banco Dibens S.A.')
Bank.create(code: '001', name: 'Banco do Brasil S.A.')
Bank.create(code: '047', name: 'Banco do Estado de Sergipe S.A.')
Bank.create(code: '037', name: 'Banco do Estado do Pará S.A.')
Bank.create(code: '039', name: 'Banco do Estado do Piauí S.A. - BEP')
Bank.create(code: '041', name: 'Banco do Estado do Rio Grande do Sul S.A.')
Bank.create(code: '004', name: 'Banco do Nordeste do Brasil S.A.')
Bank.create(code: '265', name: 'Banco Fator S.A.')
Bank.create(code: 'M03', name: 'Banco Fiat S.A.')
Bank.create(code: '224', name: 'Banco Fibra S.A.')
Bank.create(code: '626', name: 'Banco Ficsa S.A.')
Bank.create(code: 'M18', name: 'Banco Ford S.A.')
Bank.create(code: '233', name: 'Banco GE Capital S.A.')
Bank.create(code: '734', name: 'Banco Gerdau S.A.')
Bank.create(code: 'M07', name: 'Banco GMAC S.A.')
Bank.create(code: '612', name: 'Banco Guanabara S.A.')
Bank.create(code: 'M22', name: 'Banco Honda S.A.')
Bank.create(code: '063', name: 'Banco Ibi S.A. Banco Múltiplo')
Bank.create(code: 'M11', name: 'Banco IBM S.A.')
Bank.create(code: '604', name: 'Banco Industrial do Brasil S.A.')
Bank.create(code: '320', name: 'Banco Industrial e Comercial S.A.')
Bank.create(code: '653', name: 'Banco Indusval S.A.')
Bank.create(code: '630', name: 'Banco Intercap S.A.')
Bank.create(code: '077-9', name: 'Banco Intermedium S.A.')
Bank.create(code: '249', name: 'Banco Investcred Unibanco S.A.')
Bank.create(code: 'M09', name: 'Banco Itaucred Financiamentos S.A.')
Bank.create(code: '184', name: 'Banco Itaú BBA S.A.')
Bank.create(code: '479', name: 'Banco ItaúBank S.A')
Bank.create(code: '376', name: 'Banco J. P. Morgan S.A.')
Bank.create(code: '074', name: 'Banco J. Safra S.A.')
Bank.create(code: '217', name: 'Banco John Deere S.A.')
Bank.create(code: '076', name: 'Banco KDB S.A.')
Bank.create(code: '757', name: 'Banco KEB do Brasil S.A.')
Bank.create(code: '600', name: 'Banco Luso Brasileiro S.A.')
Bank.create(code: '212', name: 'Banco Matone S.A.')
Bank.create(code: 'M12', name: 'Banco Maxinvest S.A.')
Bank.create(code: '389', name: 'Banco Mercantil do Brasil S.A.')
Bank.create(code: '746', name: 'Banco Modal S.A.')
Bank.create(code: 'M10', name: 'Banco Moneo S.A.')
Bank.create(code: '738', name: 'Banco Morada S.A.')
Bank.create(code: '066', name: 'Banco Morgan Stanley S.A.')
Bank.create(code: '243', name: 'Banco Máxima S.A.')
Bank.create(code: '045', name: 'Banco Opportunity S.A.')
Bank.create(code: 'M17', name: 'Banco Ourinvest S.A.')
Bank.create(code: '623', name: 'Banco Panamericano S.A.')
Bank.create(code: '611', name: 'Banco Paulista S.A.')
Bank.create(code: '613', name: 'Banco Pecúnia S.A.')
Bank.create(code: '094-2', name: 'Banco Petra S.A.')
Bank.create(code: '643', name: 'Banco Pine S.A.')
Bank.create(code: '724', name: 'Banco Porto Seguro S.A.')
Bank.create(code: '735', name: 'Banco Pottencial S.A.')
Bank.create(code: '638', name: 'Banco Prosper S.A.')
Bank.create(code: 'M24', name: 'Banco PSA Finance Brasil S.A.')
Bank.create(code: '747', name: 'Banco Rabobank International Brasil S.A.')
Bank.create(code: '088-4', name: 'Banco Randon S.A.')
Bank.create(code: '356', name: 'Banco Real S.A.')
Bank.create(code: '633', name: 'Banco Rendimento S.A.')
Bank.create(code: '741', name: 'Banco Ribeirão Preto S.A.')
Bank.create(code: 'M16', name: 'Banco Rodobens S.A.')
Bank.create(code: '072', name: 'Banco Rural Mais S.A.')
Bank.create(code: '453', name: 'Banco Rural S.A.')
Bank.create(code: '422', name: 'Banco Safra S.A.')
Bank.create(code: '033', name: 'Banco Santander (Brasil) S.A.')
Bank.create(code: '250', name: 'Banco Schahin S.A.')
Bank.create(code: '743', name: 'Banco Semear S.A.')
Bank.create(code: '749', name: 'Banco Simples S.A.')
Bank.create(code: '366', name: 'Banco Société Générale Brasil S.A.')
Bank.create(code: '637', name: 'Banco Sofisa S.A.')
Bank.create(code: '012', name: 'Banco Standard de Investimentos S.A.')
Bank.create(code: '464', name: 'Banco Sumitomo Mitsui Brasileiro S.A.')
Bank.create(code: '082-5', name: 'Banco Topázio S.A.')
Bank.create(code: 'M20', name: 'Banco Toyota do Brasil S.A.')
Bank.create(code: 'M13', name: 'Banco Tricury S.A.')
Bank.create(code: '634', name: 'Banco Triângulo S.A.')
Bank.create(code: 'M14', name: 'Banco Volkswagen S.A.')
Bank.create(code: 'M23', name: 'Banco Volvo (Brasil) S.A.')
Bank.create(code: '655', name: 'Banco Votorantim S.A.')
Bank.create(code: '610', name: 'Banco VR S.A.')
Bank.create(code: '370', name: 'Banco WestLB do Brasil S.A.')
Bank.create(code: '021', name: 'BANESTES S.A. Banco do Estado do Espírito Santo')
Bank.create(code: '719', name: 'Banif-Banco Internacional do Funchal (Brasil)S.A.')
Bank.create(code: '755', name: 'Bank of America Merrill Lynch Banco Múltiplo S.A.')
Bank.create(code: '744', name: 'BankBoston N.A.')
Bank.create(code: '073', name: 'BB Banco Popular do Brasil S.A.')
Bank.create(code: '078', name: 'BES Investimento do Brasil S.A.-Banco de Investimento')
Bank.create(code: '069', name: 'BPN Brasil Banco Múltiplo S.A.')
Bank.create(code: '070', name: 'BRB - Banco de Brasília S.A.')
Bank.create(code: '092-2', name: 'Brickell S.A. Crédito')
Bank.create(code: '104', name: 'Caixa Econômica Federal')
Bank.create(code: '477', name: 'Citibank N.A.')
Bank.create(code: '081-7', name: 'Concórdia Banco S.A.')
Bank.create(code: '097-3', name: 'Cooperativa Central de Crédito Noroeste Brasileiro Ltda.')
Bank.create(code: '085-x', name: 'Cooperativa Central de Crédito Urbano-CECRED')
Bank.create(code: '099-x', name: 'Cooperativa Central de Economia e Credito Mutuo das Unicreds')
Bank.create(code: '090-2', name: 'Cooperativa Central de Economia e Crédito Mutuo das Unicreds')
Bank.create(code: '089-2', name: 'Cooperativa de Crédito Rural da Região de Mogiana')
Bank.create(code: '087-6', name: 'Cooperativa Unicred Central Santa Catarina')
Bank.create(code: '098-1', name: 'Credicorol Cooperativa de Crédito Rural')
Bank.create(code: '487', name: 'Deutsche Bank S.A. - Banco Alemão')
Bank.create(code: '751', name: 'Dresdner Bank Brasil S.A. - Banco Múltiplo')
Bank.create(code: '064', name: 'Goldman Sachs do Brasil Banco Múltiplo S.A.')
Bank.create(code: '062', name: 'Hipercard Banco Múltiplo S.A.')
Bank.create(code: '399', name: 'HSBC Bank Brasil S.A. - Banco Múltiplo')
Bank.create(code: '168', name: 'HSBC Finance (Brasil) S.A. - Banco Múltiplo')
Bank.create(code: '492', name: 'ING Bank N.V.')
Bank.create(code: '652', name: 'Itaú Unibanco Holding S.A.')
Bank.create(code: '341', name: 'Itaú Unibanco S.A.')
Bank.create(code: '079', name: 'JBS Banco S.A.')
Bank.create(code: '488', name: 'JPMorgan Chase Bank')
Bank.create(code: '014', name: 'Natixis Brasil S.A. Banco Múltiplo')
Bank.create(code: '753', name: 'NBC Bank Brasil S.A. - Banco Múltiplo')
Bank.create(code: '086-8', name: 'OBOE Crédito Financiamento e Investimento S.A.')
Bank.create(code: '254', name: 'Paraná Banco S.A.')
Bank.create(code: '409', name: 'UNIBANCO - União de Bancos Brasileiros S.A.')
Bank.create(code: '230', name: 'Unicard Banco Múltiplo S.A.')
Bank.create(code: '091-4', name: 'Unicred Central do Rio Grande do Sul')
Bank.create(code: '084', name: 'Unicred Norte do Paraná')

puts "Criando Tipos de contas...\n"
BankAccountType.delete_all
BankAccountType.create(code: '001', name: 'Conta Corrente Pessoa Física')
BankAccountType.create(code: '002', name: 'Conta Poupança Pessoa Física')
BankAccountType.create(code: '003', name: 'Conta Corrente Pessoa Jurídica')
