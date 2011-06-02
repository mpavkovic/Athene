Ext.define('Athene.view.adresa.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.adresaform',
    id: 'adresaform',
    
    title: 'Nova Adresa',
    layout: 'fit',
    width: 400,
    height: 370,
    constrain: true,
       
    initComponent: function() {
	var me = this;
        this.items = [
            {
                xtype: 'form',
                bodyPadding: 5,
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                
                api: {
                    submit: Adresa.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboAdresaUcenik',
                        store: new Athene.store.Ucenik({pageSize: 20, queryMode: 'remote'}),
						pageSize: 20,
						queryMode: 'remote',
                        fieldLabel: 'Učenik',
                        displayField: 'prezime',
                        valueField: 'oib',
						name: 'ucenik_id',
						listConfig: {
							loadingText: 'Tražim...',
							emptyText: 'Nema rezultata.',
							// Custom rendering template for each item
							getInnerTpl: function() {
	                        return '<div class="search-item">' +
	                            '<h3>{prezime} {ime}</h3>' +
	                            'OIB: {oib}' +
	                        '</div>';
							}
						}
                    },
                    {
                        xtype: 'textfield',
                        name: 'tip_adrese',
                        fieldLabel: 'Tip adrese',
                        allowBlank: false,
						maxLength: 100
                    },
                    {
                        xtype: 'textfield',
                        name: 'ulica',
                        fieldLabel: 'Ulica',
                        allowBlank: false,
						maxLength: 100
                    },
                    {
                        xtype: 'textfield',
                        name: 'broj',
                        fieldLabel: 'Broj',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'datum_od',
                        fieldLabel: 'Datum od',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'datum_do',
                        fieldLabel: 'Datum do',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d'
                        //allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'telefon',
                        fieldLabel: 'Telefon',
                        allowBlank: false,
						maxLength: 30
                    },
                    {
                        xtype: 'textfield',
                        name: 'mobitel',
                        fieldLabel: 'Mobitel',
                        allowBlank: false,
						maxLength: 30
                    },
                    {
                        xtype: 'textfield',
                        name: 'stanuje_s',
                        fieldLabel: 'Stanuje s',
                        allowBlank: false,
						maxLength: 30
                    },
                    {
                        xtype: 'combo',
                        id: 'comboAdresaMjesto',
                        store: new Athene.store.Mjesto({pageSize: 20, queryMode: 'remote'}),
						pageSize: 20,
						queryMode: 'remote',
                        fieldLabel: 'Mjesto',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'mjesto_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboAdresaRazlogBor',
                        store: 'RazlogBoravista',
                        fieldLabel: 'Razlog Boravišta',
                        displayField: 'opis',
                        valueField: 'id',
						name: 'razlog_boravista_id'
                    },
                ],
                buttons: [
		    {
			text: 'Odustani',
			align: 'left',
			buttonAlign: 'left',
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
			message: 'Adresa je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Adresa');
			// Add new record to store
			Ext.getStore('Adresa').add(r);
			// Resort
			Ext.getStore('Adresa').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Adresa nije dodana (greška)',
			icon: 'img/icons/exclamation.png'
			});
					}
			})
				}
			}
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});