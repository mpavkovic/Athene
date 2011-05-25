Ext.define('Athene.view.razlogboravista.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.razlogboravistaform',
    id: 'razlogboravistaform',
    
    title: 'Novi razlog boravista',
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
                    submit: RazlogBoravista.save
                },
    
                items: [
                    {
                        xtype: 'textareafield',
                        name: 'opis',
                        fieldLabel: 'Opis',
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