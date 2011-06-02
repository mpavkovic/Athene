Ext.define('Athene.view.nastavniplan.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavniplanform',
    id: 'nastavniplanform',
    
    title: 'Novi nastavni plan',
    layout: 'fit',
    width: 300,
    height: 140,
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
                    submit: NastavniPlan.save
                },
    
                items: [
                    {
                        xtype: 'textareafield',
                        name: 'opis',
                        fieldLabel: 'Opis',
                        allowBlank: false,
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
			message: 'Nastavni plan je uspješno dodan',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.NastavniPlan');
			// Add new record to store
			Ext.getStore('NastavniPlan').add(r);
			// Resort
			Ext.getStore('NastavniPlan').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Nastavni plan nije dodan (greška)',
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