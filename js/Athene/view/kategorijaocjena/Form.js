Ext.define('Athene.view.kategorijaocjena.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.kategorijaocjenaform',
    id: 'kategorijaocjenaform',
    
    title: 'Nova kategorija ocjena',
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
                    submit: KategorijaOcjena.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
                        maxLength: 250
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
			message: 'Kategorija ocjene je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.KategorijaOcjena');
			// Add new record to store
			Ext.getStore('KategorijaOcjena').add(r);
			// Resort
			Ext.getStore('KategorijaOcjena').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Kategorija ocjena nije dodana (greška)',
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