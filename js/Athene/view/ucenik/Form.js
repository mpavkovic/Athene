Ext.require([
    'Ext.form.*'
]);
Ext.apply(Ext.form.field.VTypes, {
        daterange: function(val, field) {
            var date = field.parseDate(val);

            if (!date) {
                return false;
            }
            if (field.startDateField && (!this.dateRangeMax || (date.getTime() != this.dateRangeMax.getTime()))) {
                var start = field.up('form').down('#' + field.startDateField);
                start.setMaxValue(date);
                start.validate();
                this.dateRangeMax = date;
            }
            else if (field.endDateField && (!this.dateRangeMin || (date.getTime() != this.dateRangeMin.getTime()))) {
                var end = field.up('form').down('#' + field.endDateField);
                end.setMinValue(date);
                end.validate();
                this.dateRangeMin = date;
            }
			
            return true;
        },

        daterangeText: 'Start date must be less than end date', 
});

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
    width: 350,
    height: 375,
    constrain: true,
       
    initComponent: function() {
	var me = this;
        this.items = [
	    {
		xtype: 'form',
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
		},
            items: [{
                xtype: 'tabpanel',
		bodyPadding: 5,
                activeTab: 0,

                
                api: {
                    submit: Ucenik.save
                },
    
                items: [{
		    xtype: 'panel',
		    title: 'Osnovni podaci',
		    height: 180,
		    items: [{
			xtype: 'textfield',
			name: 'oib',
			fieldLabel: 'OIB',
			allowBlank: false,
			minLength: 11,
			maxLength: 11,
			enforceMaxLength: true,
			vtype: 'oib'
		    },
		    {
			xtype: 'textfield',
			name: 'jmbg',
			fieldLabel: 'JMBG',
			allowBlank: false,
			maxLength: 13,
			enforceMaxLength: true,
			minLength: 13,
			vtype: 'jmbg'
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
			store: new Athene.store.Mjesto({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
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
			store: new Athene.store.Narodnost({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
			store: 'Narodnost',
			fieldLabel: 'Narodnost',
			displayField: 'naziv',
			valueField: 'id',
			name: 'narodnost_id'
		    },
		    {
			xtype: 'combo',
			id: 'comboUcenikNacionalnaManj',
			store: new Athene.store.NacionalnaManjina({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
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
		items:	[{
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
												store: new Athene.store.Zanimanje({pageSize: 20, queryMode: 'remote'}),
												pageSize: 20,
												queryMode: 'remote',
												store: 'Zanimanje',
												fieldLabel: 'Zanimanje oca',
												displayField: 'naziv',
												valueField: 'id',
												name: 'otac_zanimanje_id'
											},
											{
												xtype: 'combo',
												id: 'comboUcenikMajkaZani',
												store: new Athene.store.Zanimanje({pageSize: 20, queryMode: 'remote'}),
												pageSize: 20,
												queryMode: 'remote',
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
												id: 'startdt',
												vtype: 'daterange',
												endDateField: 'enddt',
												submitFormat: 'Y-m-d',
												allowBlank: false
											},
											{
												xtype: 'datefield',
												name: 'smb_datum_do',
												id: 'enddt',
												vtype: 'daterange',
												startDateField: 'startdt',
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
												store: new Athene.store.VrstaPutnika({pageSize: 20, queryMode: 'remote'}),
												pageSize: 20,
												queryMode: 'remote',
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
			text: 'Odustani',
			handler: function() {
			   me.close();
			}
		    },
                    {
				text: 'Dodaj',
				scope: me,
				handler: function() {
					me.down('form').getForm().submit({
			success: function(form, action) {    
			Ext.widget('notification').popup({
			message: 'Učenik je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Ucenik');
			// Add new record to store
			Ext.getStore('Ucenik').add(r);
			// Resort
			Ext.getStore('Ucenik').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Učenik nije dodan (greška)',
			icon: 'img/icons/exclamation.png'
			});
					}
			})
				}
			}
                ]
            }]
	    }
        ];
        this.callParent(arguments);
    }
});