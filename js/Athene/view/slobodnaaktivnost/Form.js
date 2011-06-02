Ext.define('Athene.view.slobodnaaktivnost.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.slobodnaaktivnostform',
    id: 'slobodnaaktivnostform',
    
    title: 'Nova slobodna aktivnost',
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
                    submit: SlobodnaAktivnost.save
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
			message: 'Slobodna aktivnost je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.SlobodmaAktivnost');
			// Add new record to store
			Ext.getStore('SlobodnaAktivnost').add(r);
			// Resort
			Ext.getStore('SlobodnaAktivnost').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Slobodna aktivnost nije dodana (greška)',
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