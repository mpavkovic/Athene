Ext.define('Athene.view.skolskagodina.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.skgodform',
    id: 'skgodform',
    
    title: 'Nova školska godina',
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
                    submit: SkolskaGodina.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'godina',
                        fieldLabel: 'Godina',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'pocetak_sk_godine',
                        fieldLabel: 'Početak šk. godine',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'kraj_sk_godine',
                        fieldLabel: 'Kraj šk. godine',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'kraj_prvog_polugodista',
                        fieldLabel: 'Kraj prvog polugodišta',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'datefield',
                        name: 'pocetak_drugog_polugodista',
                        fieldLabel: 'Početak drugog polugodišta',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
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