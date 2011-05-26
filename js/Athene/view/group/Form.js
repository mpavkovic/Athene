Ext.define('Athene.view.group.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.groupform',
    id: 'groupform',
    
    title: 'Nova grupa',
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
		defaultType: 'textfield',
                
                api: {
                    submit: Group.save
                },
    
                items: [
                    {
                        name: 'name',
                        fieldLabel: 'Naziv',
                        allowBlank: false
                    }
                ],
                buttons: [
                    {
                        text: 'Dodaj',
			id: 'formGroupSubmit',
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