Ext.define('Athene.view.metodskajedinica.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.metodskajedinicaform',
    id: 'metodskajedinicaform',
    
    title: 'Nova Metodska jedinica',
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
                    submit: MetodskaJedinica.save
                },
    
                items: [
                    {
                        xtype: 'textareafield',
                        name: 'opis',
                        fieldLabel: 'Opis',
                        allowBlank: false,
						grow: true,
						anchor: '100%'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboMetodskaJedinicaNastavnaJedinica',
                        store: 'NastavnaJedinica',
                        fieldLabel: 'Nastavna jedinica',
                        displayField: 'opis',
                        valueField: 'id',
						name: 'nastavna_jedinica_id'
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