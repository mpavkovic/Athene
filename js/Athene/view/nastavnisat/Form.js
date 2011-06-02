Ext.define('Athene.view.nastavnisat.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavnisatform',
    id: 'nastavnisatform',
    
    title: 'Novi Nastavni Sat',
    layout: 'fit',
    width: 400,
    height: 340,
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
                    submit: NastavniSat.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboNastavniSatUcitelj',
			store: new Athene.store.Ucitelj({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'Ucitelj',
                        fieldLabel: 'Učitelj',
                        displayField: 'prezime',
                        valueField: 'id',
						name: 'ucitelj_id'
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
                        name: 'opis',
                        fieldLabel: 'Opis',
                        allowBlank: false,
						grow: true,
						anchor: '100%'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNastavniSatMetodskaJedinica',
			store: new Athene.store.MetodskaJedinica({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'MetodskaJedinica',
                        fieldLabel: 'Metodska Jedinica',
                        displayField: 'opis',
                        valueField: 'id',
						name: 'metodska_jedinica_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNastavniSatKategorijaPredRazOdj',
			store: new Athene.store.PredmetRazrednogOdjeljenja({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'PredmetRazrednogOdjeljenja',
                        fieldLabel: 'Predmet razrednog odjeljenja',
                        displayField: 'predmet_id',
                        valueField: 'id',
						name: 'predmet_razrednog_odjeljenja_id'
                    },
                    {
                        xtype: 'textareafield',
                        name: 'napomena',
                        fieldLabel: 'Napomena',
                        allowBlank: false,
						grow: true,
						anchor: '100%',
						maxLength: 250
                    },
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
			message: 'Nastavni sat je uspješno dodan',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.NastavniSat');
			// Add new record to store
			Ext.getStore('NastavniSat').add(r);
			// Resort
			Ext.getStore('NastavniSat').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Nastavni sat nije dodan (greška)',
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