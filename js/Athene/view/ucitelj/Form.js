Ext.define('Athene.view.ucitelj.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.uciteljform',
    id: 'uciteljform',
    
    title: 'Dodaj učitelja',
    layout: 'fit',
    width: 300,
    height: 190,
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
                    submit: Ucitelj.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'ime',
                        fieldLabel: 'Ime',
                        allowBlank: false,
                        maxLength: 50
                    },
                    {
                        xtype: 'textfield',
                        name: 'prezime',
                        fieldLabel: 'Prezime',
                        allowBlank: false,
                        maxLength: 50
                    },
                    {
                        xtype: 'textfield',
                        name: 'telefon',
                        fieldLabel: 'Telefon',
                        allowBlank: false,
                        maxLength: 20
                    },
                    {
                        xtype: 'textfield',
                        name: 'email',
                        fieldLabel: 'Email',
                        vtype: 'email',
                        allowBlank: false,
                        maxLength: 255
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
                        id: 'addUcitelj',
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