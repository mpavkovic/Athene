Ext.define('Athene.view.mjesto.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.mjestoform',
    id: 'mjestoform',
    
    title: 'Novo Mjesto',
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
                    submit: Mjesto.save
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