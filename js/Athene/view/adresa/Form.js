Ext.define('Athene.view.adresa.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.adresaform',
    id: 'adresaform',
    
    title: 'Nova Adresa',
    layout: 'fit',
    width: 300,
    height: 370,
    constrain: true,
       
    initComponent: function() {
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
                        id: 'comboAdresa',
                        store: 'Ucenik',
                        fieldLabel: 'Učenik',
                        displayField: 'prezime',
                        valueField: 'id',
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
                        store: 'Mjesto',
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