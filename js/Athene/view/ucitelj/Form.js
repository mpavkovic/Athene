Ext.define('Athene.view.ucitelj.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.uciteljform',
    id: 'uciteljform',
    
    title: 'Dodaj učitelja',
    layout: 'fit',
    width: 300,
    height: 190,
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
                    submit: Ucitelj.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'ime',
                        fieldLabel: 'Ime',
                        allowBlank: false,
                        maxLength: 50
                    },
                    {
                        xtype: 'textfield',
                        name: 'prezime',
                        fieldLabel: 'Prezime',
                        allowBlank: false,
                        maxLength: 50
                    },
                    {
                        xtype: 'textfield',
                        name: 'telefon',
                        fieldLabel: 'Telefon',
                        allowBlank: false,
                        maxLength: 20
                    },
                    {
                        xtype: 'textfield',
                        name: 'email',
                        fieldLabel: 'Email',
                        vtype: 'email',
                        allowBlank: false,
                        maxLength: 255
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
			message: 'Učitelj je uspješno dodan',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Ucitelj');
			// Add new record to store
			Ext.getStore('Ucitelj').add(r);
			// Resort
			Ext.getStore('Ucitelj').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Učitelj nije dodan (greška)',
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