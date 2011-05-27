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
    height: 355,
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
								title: 'Tab 1',
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
												fieldLabel: 'Datum',
												format: 'd.m.Y.',
												submitFormat: 'Y-m-d',
												allowBlank: false
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
											}
									]
							},
							{
								xtype: 'panel',
								title: 'Tab 2',
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
											}
										]
							},
							{
								xtype: 'panel',
								title: 'Tab 3',
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
												fieldLabel: 'Datum od',
												format: 'd.m.Y.',
												submitFormat: 'Y-m-d',
												allowBlank: false
											},
											{
												xtype: 'datefield',
												name: 'smb_datum_do',
												fieldLabel: 'Datum do',
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
												fieldLabel: 'Datum',
												format: 'd.m.Y.',
												submitFormat: 'Y-m-d',
												allowBlank: false
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