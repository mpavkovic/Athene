Ext.define('Athene.view.drzava.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.drzavaform',
    id: 'drzavaform',
    
    title: 'Nova država',
    layout: 'fit',
    width: 300,
    height: 260,
    constrain: true,
       
    initComponent: function() {
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
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'drzavljanstvo',
                        fieldLabel: 'Državljanstvo',
                        allowBlank: false
                    }
                ],
                buttons: [
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