Ext.define('Athene.view.drzava.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.drzavaform',
    id: 'drzavaform',
    
    title: 'Nova država',
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
                    submit: Drzava.save
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
                        xtype: 'textfield',
                        name: 'drzavljanstvo',
                        fieldLabel: 'Državljanstvo',
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
			message: 'Država je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Drzava');
			// Add new record to store
			Ext.getStore('Drzava').add(r);
			// Resort
			Ext.getStore('Drzava').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Država nije dodana (greška)',
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