Ext.define('Athene.view.predmetnacjelina.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetnacjelinaform',
    id: 'predmetnacjelinaform',
    
    title: 'Nova Predmetna Cjelina',
    layout: 'fit',
    width: 300,
    height: 130,
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
                    submit: PredmetnaCjelina.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
			maxLength: 100
                    },
                    {
                        xtype: 'combo',
                        id: 'comboPredmetnaCjelina',
			store: new Athene.store.PredmetnaCjelina({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'Predmet',
                        fieldLabel: 'Predmet',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'predmet_id'
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
			message: 'Predmetna cjelina je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.PredmetnaCjelina');
			// Add new record to store
			Ext.getStore('PredmetnaCjelina').add(r);
			// Resort
			Ext.getStore('PredmetnaCjelina').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Predmetna cjelina nije dodana (greška)',
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