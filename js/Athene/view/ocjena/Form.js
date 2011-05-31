var odabir_ocjene = Ext.create('Ext.data.Store', {
    fields: ['abbr','naziv'],
    data : [
        {"abbr":"1", "naziv":"nedovoljan"},
        {"abbr":"2", "naziv":"dovoljan"},
        {"abbr":"3", "naziv":"dobar"},
        {"abbr":"4", "naziv":"vrlo dobar"},
        {"abbr":"5", "naziv":"odličan"}
    ]
});
Ext.define('Athene.view.ocjena.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.ocjenaform',
    id: 'ocjenaform',
    
    title: 'Nova Ocjena',
    layout: 'fit',
    width: 300,
    height: 280,
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
                    submit: Ocjena.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboOcjenaOcjena',
		    
						fieldLabel: 'Ocjena',
						store: odabir_ocjene,
						queryMode: 'local',
						displayField: 'naziv',
						valueField: 'abbr',
						name: 'ocjena'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboOcjenaUcenik',
			store: new Athene.store.Ucenik({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'Ucenik',
                        fieldLabel: 'Učenik',
                        displayField: 'prezime',
                        valueField: 'oib',
						name: 'ucenik_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboOcjenaPredmetnaCjelina',
			store: new Athene.store.PredmetnaCjelina({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'PredmetnaCjelina',
                        fieldLabel: 'Predmetna Cjelina',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'predmetna_cjelina_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboOcjenaKategorijaOcjena',
			store: new Athene.store.KategorijaOcjena({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'KategorijaOcjena',
                        fieldLabel: 'Kategorija Ocjena',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'kategorija_ocjena_id'
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
                        xtype: 'textareafield',
                        name: 'opaska',
                        fieldLabel: 'Opaska',
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
				scope: me,
				handler: function() {
					me.down('form').getForm().submit({
			success: function(form, action) {    
			Ext.widget('notification').popup({
			message: 'Ocjena je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Ocjena');
			// Add new record to store
			Ext.getStore('Ocjena').add(r);
			// Resort
			Ext.getStore('Ocjena').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Ocjena nije dodana (greška)',
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