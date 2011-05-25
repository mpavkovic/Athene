Ext.define('Athene.view.skola.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.skolaform',
    id: 'skolaform',
    
    title: 'Nova Škola',
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
                    submit: Skola.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'ravnatelj',
                        fieldLabel: 'Ime ravnatelja',
                        allowBlank: false
                    },
                    {
                        xtype: 'combo',
                        id: 'comboSkola',
                        store: 'Mjesto',
                        fieldLabel: 'Mjesto',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'mjesto_id'
                    },
                    {
                        xtype: 'textfield',
                        name: 'ulica',
                        fieldLabel: 'Ulica',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'broj',
                        fieldLabel: 'Broj',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'telefon',
                        fieldLabel: 'Telefon',
                        allowBlank: true
                    },
                    {
                        xtype: 'textfield',
                        name: 'fax',
                        fieldLabel: 'Fax',
                        allowBlank: true
                    },
                    {
                        xtype: 'textfield',
                        name: 'email',
						vtype: 'email',
                        fieldLabel: 'Email',
                        allowBlank: true
                    },
                    {
                        xtype: 'textfield',
                        name: 'web',
                        fieldLabel: 'Web sjedište',
                        allowBlank: true
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