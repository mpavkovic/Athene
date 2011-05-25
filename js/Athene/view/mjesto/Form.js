Ext.define('Athene.view.mjesto.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.mjestoform',
    id: 'mjestoform',
    
    title: 'Novo Mjesto',
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
                    submit: Mjesto.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false
                    },
                    {
                        xtype: 'combo',
                        id: 'comboMjesto',
                        store: 'Drzava',
                        fieldLabel: 'Država',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'drzava_id'
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