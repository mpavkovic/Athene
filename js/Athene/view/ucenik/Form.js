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
        {"abbr":"M", "naziv":"Muško"},
        {"abbr":"Z", "naziv":"Žensko"}
    ]
});
Ext.define('Athene.view.ucenik.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.ucenikform',
    id: 'ucenikform',
    
    title: 'Novi učenik',
    layout: 'fit',
    width: 320,
    height: 310,
    constrain: true,
       
    initComponent: function() {
	var me = this;
        this.items = [
            {
<<<<<<< HEAD
                xtype: 'form',
                bodyPadding: 5,
=======
                xtype: 'tabpanel',
		bodyPadding: 5,
                activeTab: 0,
>>>>>>> 4f81e83b0b2a2a1da2bca470e0e8896675a9d5eb
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                
                api: {
                    submit: Ucenik.save
                },
    
                items: [
<<<<<<< HEAD
{
                 xtype:'tabpanel'
                ,activeItem:0
                ,border:false
 
                // this line is necessary for anchoring to work at
                // lower level containers and for full height of tabs
                ,anchor:'100% 100%'
 
                // only fields from an active tab are submitted
                // if the following line is not persent
                ,deferredRender:false
 
                // tabs
                ,defaults:{
                    labelWidth:80
                    ,defaultType:'textfield'
                    ,bodyStyle:'padding:5px'
 
                    // as we use deferredRender:false we mustn't
                    // render tabs into display:none containers
                    ,hideMode:'offsets'
                }
                ,items:[
							{
								xtype: 'panel',
								title: 'Osnovni podaci',
								height: 180,
								items: [
											{
												xtype: 'textfield',
												name: 'oib',
												fieldLabel: 'OIB',
												allowBlank: false,
												maxLength: 11,
												minLength: 11
											},
											{
												xtype: 'textfield',
												name: 'jmbg',
												fieldLabel: 'JMBG',
												allowBlank: false,
												maxLength: 13,
												minLength: 13
											},
											{
												xtype: 'textfield',
												name: 'ime',
												fieldLabel: 'Ime',
												allowBlank: false,
												maxLength: 50
											},
											{
												xtype: 'textfield',
												name: 'prezime',
												fieldLabel: 'Prezime',
												allowBlank: false,
												maxLength: 50
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
=======
		    {
			xtype: 'panel',
			title: 'Osnovni podaci',
			height: 180,
			items: [
			    {
				xtype: 'textfield',
				name: 'oib',
				fieldLabel: 'OIB',
				allowBlank: false,
				vtype: 'oib',
				minLength : 11,
				enforceMaxLength: true
			    },
			    {
				xtype: 'textfield',
				name: 'jmbg',
				fieldLabel: 'JMBG',
				allowBlank: false,
				vtype: 'jmbg',
				minLength : 13,
				enforceMaxLength: true
			    },
			    {
				xtype: 'textfield',
				name: 'ime',
				fieldLabel: 'Ime',
				allowBlank: false,
				maxLength: 50
			    },
			    {
				xtype: 'textfield',
				name: 'prezime',
				fieldLabel: 'Prezime',
				allowBlank: false,
				maxLength: 50
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
>>>>>>> 4f81e83b0b2a2a1da2bca470e0e8896675a9d5eb
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
												allowBlank: false,
												maxLength: 50
											},
											{
												xtype: 'textfield',
												name: 'otac_ime_gen',
												fieldLabel: 'Otac ime genitiv',
												allowBlank: false,
												maxLength: 50
											},
											{
												xtype: 'textfield',
												name: 'majka_ime_nom',
												fieldLabel: 'Majka ime nominativ',
												allowBlank: false,
												maxLength: 50
											},
											{
												xtype: 'textfield',
												name: 'majka_ime_gen',
												fieldLabel: 'Majka ime genitiv',
												allowBlank: false,
												maxLength: 50
											},
											{
												xtype: 'textfield',
												name: 'majka_djevojacko',
												fieldLabel: 'Majka djevojačko',
												allowBlank: false,
												maxLength: 50
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
												allowBlank: false,
												maxLength: 100
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
												submitFormat: 'Y-m-d'
												// allowBlank: false
											},
											{
												xtype: 'combo',
												id: 'comboUcenikHospitant',
												fieldLabel: 'Hospitant',
												store: odabir_da_ne,
												queryMode: 'local',
												displayField: 'naziv',
												valueField: 'abbr',
												name: 'hospitant',
												maxLength: 11
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
				]
            }
				],
                buttons: [
		    {
			text: 'Odustani',
			handler: function() {
			   me.close();
			}
		    },
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