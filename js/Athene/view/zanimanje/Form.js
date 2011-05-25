Ext.define('Athene.view.zanimanje.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.zanimanjeform',
    id: 'zanimanjeform',
    
    title: 'Novo zanimanje',
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
                    submit: Zanimanja.save
                },
    
                items: [
                    {
                        xtype: 'textareafield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
						grow: true,
						anchor: '100%'
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