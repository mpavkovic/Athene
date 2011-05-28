Ext.define('Athene.view.nastavnajedinica.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavnajedinicaform',
    id: 'nastavnajedinicaform',
    
    title: 'Nova Nastavna jedinica',
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
                    submit: NastavnaJedinica.save
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
                        id: 'comboNastavnaJedinicaNastavniPlan',
                        store: 'NastavniPlan',
                        fieldLabel: 'Nastavni plan',
                        displayField: 'opis',
                        valueField: 'id',
						name: 'nastavni_plan_id'
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