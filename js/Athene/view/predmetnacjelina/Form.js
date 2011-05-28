Ext.define('Athene.view.predmetnacjelina.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetnacjelinaform',
    id: 'predmetnacjelinaform',
    
    title: 'Nova Predmetna Cjelina',
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