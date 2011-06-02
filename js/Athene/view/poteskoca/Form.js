Ext.define('Athene.view.poteskoca.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.poteskocaform',
    id: 'poteskocaform',
    
    title: 'Nova poteškoća',
    layout: 'fit',
    width: 300,
    height: 90,
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
                    submit: Poteskoca.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
                        maxLength: 200
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
			message: 'Poteškoća je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Poteskoca');
			// Add new record to store
			Ext.getStore('Poteskoca').add(r);
			// Resort
			Ext.getStore('Poteskoca').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Poteškoća nije dodana (greška)',
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