Ext.define('Athene.view.nacionalnamanjina.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.nacionalnamanjinaform',
    id: 'drzavaform',
    
    title: 'Nova nacionalna manjina',
    layout: 'fit',
    width: 300,
    height: 260,
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
                    submit: NacionalnaManjina.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
                        maxLength: 100
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
			message: 'Nacionalna manjina je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.NacionalnaManjina');
			// Add new record to store
			Ext.getStore('NacionalnaManjina').add(r);
			// Resort
			Ext.getStore('NacionalnaManjina').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Nacionalna manjina nije dodana (greška)',
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