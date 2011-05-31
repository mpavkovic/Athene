Ext.define('Athene.view.narodnost.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.narodnostform',
    id: 'narodnostform',
    
    title: 'Nova narodnost',
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
                    submit: Narodnost.save
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
			message: 'Narodnost je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Narodnost');
			// Add new record to store
			Ext.getStore('Narodnost').add(r);
			// Resort
			Ext.getStore('Narodnost').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Narodnost nije dodana (greška)',
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