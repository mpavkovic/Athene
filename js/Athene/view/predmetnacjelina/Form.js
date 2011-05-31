Ext.define('Athene.view.predmetnacjelina.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetnacjelinaform',
    id: 'predmetnacjelinaform',
    
    title: 'Nova Predmetna Cjelina',
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
                    submit: PredmetnaCjelina.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
			maxLength: 100
                    },
                    {
                        xtype: 'combo',
                        id: 'comboPredmetnaCjelina',
                        store: 'Predmet',
                        fieldLabel: 'Predmet',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'predmet_id'
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