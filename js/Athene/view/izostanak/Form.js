Ext.define('Athene.view.izostanak.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.izostanakform',
    id: 'izostanakform',
    
    title: 'Novi izostanak',
    layout: 'fit',
    width: 400,
    height: 310,
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
                    submit: Izostanak.save
                },
    
                items: [{
		    xtype: 'combo',
		    id: 'comboRazred',
		    store: new Athene.store.Razred({pageSize: 20, queryMode: 'remote'}),
                    pageSize: 20,
                    queryMode: 'remote',
		    store: 'Razred',
		    fieldLabel: 'Razred',
		    displayField: 'naziv',
		    valueField: 'id',
		    name: 'razred'
		},
		{
                        xtype: 'combo',
                        id: 'comboIzostanakUcenik',
			store: new Athene.store.Ucenik({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'Ucenik',
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
                        xtype: 'combo',
                        id: 'comboIzostanakPredRazOdj',
			store: new Athene.store.PredmetRazrednogOdjeljenja({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'PredmetRazrednogOdjeljenja',
                        fieldLabel: 'Predmet razrednog odjeljenja',
                        displayField: 'predmet_id',
                        valueField: 'id',
			name: 'predmet_id'
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
			id: 'comboIzostanakOpravdano',
			fieldLabel: 'Opravdano',
			store: odabir_da_ne,
			queryMode: 'local',
			displayField: 'naziv',
			valueField: 'abbr',
			name: 'opravdano',
			maxLength: 11
		    },
		    {
                        xtype: 'textareafield',
                        name: 'opravdanje',
                        fieldLabel: 'Opravdanje',
                        allowBlank: false,
			grow: true,
			anchor: '100%'
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