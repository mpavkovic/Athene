Ext.define('Athene.view.ucenik.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.ucenikform',
    id: 'ucenikform',
    
    title: 'Novi učenik',
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
                    submit: Ucenik.save
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
                        id: 'comboUcenik',
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