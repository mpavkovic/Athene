Ext.define('Athene.view.vrstaputnika.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.vrstaputnikaform',
    id: 'vrstaputnikaform',
    
    title: 'Nova vrsta putnika',
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
                    submit: VrstaPutnika.save
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
			message: 'Vrsta putnika je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.VrstaPutnika');
			// Add new record to store
			Ext.getStore('VrstaPutnika').add(r);
			// Resort
			Ext.getStore('VrstaPutnika').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Vrsta putnika nije dodana (greška)',
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