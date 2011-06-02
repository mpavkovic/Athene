Ext.define('Athene.view.nastavnajedinica.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavnajedinicaform',
    id: 'nastavnajedinicaform',
    
    title: 'Nova Nastavna jedinica',
    layout: 'fit',
    width: 400,
    height: 170,
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
                    submit: NastavnaJedinica.save
                },
    
                items: [
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
                        id: 'comboNastavnaJedinicaNastavniPlan',
			store: new Athene.store.NastavniPlan({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'NastavniPlan',
                        fieldLabel: 'Nastavni plan',
                        displayField: 'opis',
                        valueField: 'id',
						name: 'nastavni_plan_id'
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
			message: 'Nastavna jedinica je uspjeöno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.NastavnaJedinica');
			// Add new record to store
			Ext.getStore('NastavnaJedinica').add(r);
			// Resort
			Ext.getStore('NastavnaJedinica').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Nastavna jedinica nije dodana (gre≈°ka)',
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