Ext.define('Athene.view.skolskagodina.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.skgodform',
    id: 'skgodform',
    
    title: 'Nova školska godina',
    layout: 'fit',
    width: 300,
    height: 240,
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
                    submit: SkolskaGodina.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'godina',
                        fieldLabel: 'Godina',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'pocetak_sk_godine',
                        fieldLabel: 'Početak šk. godine',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'kraj_sk_godine',
                        fieldLabel: 'Kraj šk. godine',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'kraj_prvog_polugodista',
                        fieldLabel: 'Kraj prvog polugodišta',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'pocetak_drugog_polugodista',
                        fieldLabel: 'Početak drugog polugodišta',
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
			message: 'Školska godina je uspješno dodana',
			icon: 'img/icons/accept.png'
			});
			// Create a new record from form data
			var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.SkolskaGodina');
			// Add new record to store
			Ext.getStore('SkolskaGodina').add(r);
			// Resort
			Ext.getStore('SkolskaGodina').sort();
			},
					failure: function(form, action) {
			Ext.widget('notification').popup({
			message: 'Školska godina nije dodana (greška)',
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