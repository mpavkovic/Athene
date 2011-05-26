Ext.define('Athene.view.user.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.userform',
    id: 'userform',
    
    title: 'Novi korisnik',
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
                    submit: User.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'username',
                        fieldLabel: 'Korisničko ime',
                        allowBlank: false
                    }
                ],
                buttons: [
                    {
                        text: 'Dodaj',
			id: 'formUserSubmit',
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