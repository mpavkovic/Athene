Ext.define('Athene.view.dodijeljenapoteskoca.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.dodijeljenapoteskocaform',
    id: 'dodijeljenapoteskocaform',
    
    title: 'Nova dodijeljena poteškoća',
    layout: 'fit',
    width: 300,
    height: 240,
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
                    submit: DodijeljenaPoteskoca.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboDodPoteskocaUcenik',
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
                        xtype: 'combo',
                        id: 'comboDodijeljenaPoteskocaVrstaPoteskoce',
                        store: new Athene.store.Poteskoca({pageSize: 20, queryMode: 'remote'}),
						pageSize: 20,
						queryMode: 'remote',
                        fieldLabel: 'Vrsta poteškoće',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'vrsta_poteskoce_id'
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
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'klasa',
                        fieldLabel: 'Klasa',
                        allowBlank: false,
						maxLength: 200
                    },
                    {
                        xtype: 'textfield',
                        name: 'urudzbeni_broj',
                        fieldLabel: 'Uruđbeni broj',
                        allowBlank: false,
						maxLength: 200
                    }
                ],
                buttons: [
		    {
			text: 'Odustani',
			//align: 'left',
			//buttonAlign: 'left',
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
			message: 'Dodijeljena poteškoća je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.DodijeljenaPoteskoca');
			// Add new record to store
			Ext.getStore('DodijeljenaPoteskoca').add(r);
			// Resort
			Ext.getStore('DodijeljenaPoteskoca').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Dodijeljena poteskoca nije dodana (greška)',
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