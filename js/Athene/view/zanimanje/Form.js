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
                    submit: Zanimanje.save
                },
    
                items: [
                    {
                        xtype: 'textareafield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
						grow: true,
						anchor: '100%',
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