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
                        handler: function() {
                            this.up('form').getForm().submit();
                        }
                    }
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});