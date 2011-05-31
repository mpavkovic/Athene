Ext.define('Athene.view.skola.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.skolaform',
    id: 'skolaform',
    
    title: 'Nova Škola',
    layout: 'fit',
    width: 300,
    height: 315,
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
                    submit: Skola.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
			maxLength: 200
                    },
                    {
                        xtype: 'textfield',
                        name: 'ravnatelj',
                        fieldLabel: 'Ime ravnatelja',
                        allowBlank: false,
			maxLength: 100
                    },
                    {
                        xtype: 'combo',
                        id: 'comboSkola',
			store: new Athene.store.Mjesto({pageSize: 20, queryMode: 'remote'}),
			pageSize: 20,
			queryMode: 'remote',
                        store: 'Mjesto',
                        fieldLabel: 'Mjesto',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'mjesto_id'
                    },
                    {
                        xtype: 'textfield',
                        name: 'ulica',
                        fieldLabel: 'Ulica',
                        allowBlank: false,
			maxLength: 100
                    },
                    {
                        xtype: 'textfield',
                        name: 'broj',
                        fieldLabel: 'Broj',
                        allowBlank: false,
			vtype: 'alphanum'
                    },
                    {
                        xtype: 'textfield',
                        name: 'telefon',
                        fieldLabel: 'Telefon',
                        allowBlank: true,
			maxLength: 30
                    },
                    {
                        xtype: 'textfield',
                        name: 'fax',
                        fieldLabel: 'Fax',
                        allowBlank: true,
			maxLength: 30
                    },
                    {
                        xtype: 'textfield',
                        name: 'email',
						vtype: 'email',
                        fieldLabel: 'Email',
                        allowBlank: true,
			maxLength: 255
                    },
                    {
                        xtype: 'textfield',
                        name: 'web',
                        fieldLabel: 'Web sjedište',
                        allowBlank: true,
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
			message: 'Škola je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Skola');
			// Add new record to store
			Ext.getStore('Skola').add(r);
			// Resort
			Ext.getStore('Skola').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Škola nije dodana (greška)',
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