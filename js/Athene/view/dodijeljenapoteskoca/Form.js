Ext.define('Athene.view.dodijeljenapoteskoca.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.dodijeljenapoteskocaform',
    id: 'dodijeljenapoteskocaform',
    
    title: 'Nova dodijeljena poteškoća',
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
                    submit: DodijeljenaPoteskoca.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboDodijeljenaPoteskocaUcenik',
                        store: 'Ucenik',
                        fieldLabel: 'Učenik',
                        displayField: 'prezime',
                        valueField: 'oib',
						name: 'ucenik_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboDodijeljenaPoteskocaVrstaPoteskoce',
                        store: 'Poteskoca',
                        fieldLabel: 'Vrsta poteškoće',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'vrsta_poteskoce_id'
                    },
                    {
                        xtype: 'datefield',
                        name: 'datum_od',
                        fieldLabel: 'Datum od',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'datum_do',
                        fieldLabel: 'Datum do',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'klasa',
                        fieldLabel: 'Klasa',
                        allowBlank: false,
			maxLength: 200
                    },
                    {
                        xtype: 'textfield',
                        name: 'urudzbeni_broj',
                        fieldLabel: 'Uruđbeni broj',
                        allowBlank: false,
			maxLength: 200
                    }
                ],
                buttons: [
		    {
			text: 'Odustani',
			//align: 'left',
			//buttonAlign: 'left',
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