Ext.define('Athene.view.vrstaputnika.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.vrstaputnikaform',
    id: 'vrstaputnikaform',
    
    title: 'Nova vrsta putnika',
    layout: 'fit',
    width: 300,
    height: 90,
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
                    submit: VrstaPutnika.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
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