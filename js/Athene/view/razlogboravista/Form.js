Ext.define('Athene.view.razlogboravista.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.razlogboravistaform',
    id: 'razlogboravistaform',
    
    title: 'Novi razlog boravista',
    layout: 'fit',
    width: 300,
    height: 150,
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
                    submit: RazlogBoravista.save
                },
    
                items: [
                    {
                        xtype: 'textareafield',
                        name: 'opis',
                        fieldLabel: 'Opis',
                        allowBlank: false,
						grow: true,
						anchor: '100%',
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
			message: 'Razlog boravišta je uspješno dodan',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.RazlogBoravista');
			// Add new record to store
			Ext.getStore('RazlogBoravista').add(r);
			// Resort
			Ext.getStore('RazlogBoravista').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Razlog boravišta nije dodan (greška)',
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