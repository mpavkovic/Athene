var odabir_da_ne = Ext.create('Ext.data.Store', {
    fields: ['abbr','naziv'],
    data : [
        {"abbr":"1", "naziv":"Da"},
        {"abbr":"0", "naziv":"Ne"}
    ]
});

var odabir_spol = Ext.create('Ext.data.Store', {
    fields: ['abbr','naziv'],
    data : [
        {"abbr":"1", "naziv":"Muško"},
        {"abbr":"0", "naziv":"Žensko"}
    ]
});
Ext.define('Athene.view.ucenik.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.ucenikform',
    id: 'ucenikform',
    
    title: 'Novi učenik',
    layout: 'fit',
    width: 350,
    height: 375,
    constrain: true,
       
    initComponent: function() {
        this.items = [
            {
                xtype: 'tabpanel',
				bodyPadding: 5,
                activeTab: 0,
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                
                api: {
                    submit: Titula.save
                },
    
                items: [
							{
								xtype: 'panel',
								title: 'Osnovni podaci',
								height: 180,
								items: [
											{
												xtype: 'textfield',
												name: 'oib',
												fieldLabel: 'OIB',
												allowBlank: false
											},
											{
												xtype: 'textfield',
												name: 'jmbg',
												fieldLabel: 'JMBG',
												allowBlank: false
											},
											{
												xtype: 'textfield',
												name: 'ime',
												fieldLabel: 'Ime',
												allowBlank: false
											},
											{
												xtype: 'textfield',
												name: 'prezime',
												fieldLabel: 'Prezime',
												allowBlank: false
											},
											{
												xtype: 'datefield',
												name: 'datum',
												fieldLabel: 'Datum rođenja',
												format: 'd.m.Y.',
												submitFormat: 'Y-m-d',
												allowBlank: false
											},
											{
												xtype: 'combo',
												id: 'comboUcenikMjestoRod',
												store: 'Mjesto',
												fieldLabel: 'Mjesto rođenja',
												displayField: 'naziv',
												valueField: 'id',
												name: 'mjesto_id'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikSpol',
												fieldLabel: 'Spol',
												store: odabir_spol,
												queryMode: 'local',
												displayField: 'naziv',
												valueField: 'abbr',
												name: 'spol'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikSportas',
												fieldLabel: 'Sportaš',
												store: odabir_da_ne,
												queryMode: 'local',
												displayField: 'naziv',
												valueField: 'abbr',
												name: 'sportas'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikNarodnost',
												store: 'Narodnost',
												fieldLabel: 'Narodnost',
												displayField: 'naziv',
												valueField: 'id',
												name: 'narodnost_id'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikNacionalnaManj',
												store: 'NacionalnaManjina',
												fieldLabel: 'Nacionalna Manjina',
												displayField: 'naziv',
												valueField: 'id',
												name: 'nacionalna_manjina_id'
											}
									]
							},
							{
								xtype: 'panel',
								title: 'Podaci o roditeljima',
								items:	[
											{
												xtype: 'textfield',
												name: 'otac_ime_nom',
												fieldLabel: 'Otac ime nominativ',
												allowBlank: false
											},
											{
												xtype: 'textfield',
												name: 'otac_ime_gen',
												fieldLabel: 'Otac ime genitiv',
												allowBlank: false
											},
											{
												xtype: 'textfield',
												name: 'majka_ime_nom',
												fieldLabel: 'Majka ime nominativ',
												allowBlank: false
											},
											{
												xtype: 'textfield',
												name: 'majka_ime_gen',
												fieldLabel: 'Majka ime genitiv',
												allowBlank: false
											},
											{
												xtype: 'textfield',
												name: 'majka_djevojacko',
												fieldLabel: 'Majka djevojačko',
												allowBlank: false
											},
											{
												xtype: 'combo',
												id: 'comboUcenikOtacZani',
												store: 'Zanimanje',
												fieldLabel: 'Zanimanje oca',
												displayField: 'naziv',
												valueField: 'id',
												name: 'otac_zanimanje_id'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikMajkaZani',
												store: 'Zanimanje',
												fieldLabel: 'Zanimanje majke',
												displayField: 'naziv',
												valueField: 'id',
												name: 'majka_zanimanje_id'
											},
										]
							},
							{
								xtype: 'panel',
								title: 'Ostali podaci',
								items:	[
											{
												xtype: 'textfield',
												name: 'broj_domovnice',
												fieldLabel: 'Broj domovnice',
												allowBlank: false
											},
											{
												xtype: 'textfield',
												name: 'smb',
												fieldLabel: 'SMB',
												allowBlank: false
											},
											{
												xtype: 'datefield',
												name: 'smb_datum_od',
												fieldLabel: 'SMB datum od',
												format: 'd.m.Y.',
												submitFormat: 'Y-m-d',
												allowBlank: false
											},
											{
												xtype: 'datefield',
												name: 'smb_datum_do',
												fieldLabel: 'SMB datum do',
												format: 'd.m.Y.',
												submitFormat: 'Y-m-d',
												allowBlank: false
											},
											{
												xtype: 'combo',
												id: 'comboUcenikHospitant',
												fieldLabel: 'Hospitant',
												store: odabir_da_ne,
												queryMode: 'local',
												displayField: 'naziv',
												valueField: 'abbr',
												name: 'hospitant'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikStranac',
												fieldLabel: 'Stranac',
												store: odabir_da_ne,
												queryMode: 'local',
												displayField: 'naziv',
												valueField: 'abbr',
												name: 'stranac'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikSkolovanjeIZRH',
												fieldLabel: 'Školovanje izvan RH',
												store: odabir_da_ne,
												queryMode: 'local',
												displayField: 'naziv',
												valueField: 'abbr',
												name: 'skolovanje_izvan_rh'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikVrstaPutnika',
												store: 'VrstaPutnika',
												fieldLabel: 'Vrsta putnika',
												displayField: 'naziv',
												valueField: 'id',
												name: 'vrsta_putnika_id'
											}
										]
							}
						],
                buttons: [
                    {
                        text: 'Dodaj',
                        handler: function() {
                            this.up('form').getForm().submit();
                        }
                    }
                ]
            }
        ];
        this.callParent(arguments);
    }
});