Ext.define('Athene.view.help.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.helpform',
    id: 'helpform',
    
    title: 'Novi help',
    layout: 'fit',
    width: 500,
    height: 360,
    maximizable: true,
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
                    submit: Help.save
                },
    
                items: [
                    {
                        name: 'title',
                        fieldLabel: 'Naslov',
                        allowBlank: false
                    },
		    {
			name: 'tag',
			fieldLabel: 'Tag'
		    },
		    {
			xtype: 'textarea',
			fieldCls: 'ckeditor',
			name: 'content',
			fieldLabel: 'Sadržaj',
			listeners: {
			    render: function() {
				CKEDITOR.replace('content');
			    }
			}
		    }
                ],
                buttons: [
                    {
                        text: 'Dodaj',
			id: 'formHelpSubmit',
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