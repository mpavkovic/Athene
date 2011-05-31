Ext.define('Athene.view.dogadjaj.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.dogadjajform',
    id: 'dogadjajform',
    
    title: 'Novi dogadjaj',
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
                    submit: Dogadjaj.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
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
                        xtype: 'datefield',
                        name: 'datum',
                        fieldLabel: 'Datum',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
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
			message: 'Događaj je uspješno dodan',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Dogadjaj');
			// Add new record to store
			Ext.getStore('Dogadjaj').add(r);
			// Resort
			Ext.getStore('Dogadjaj').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Događaj nije dodana (greška)',
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