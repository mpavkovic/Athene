Ext.define('Athene.view.zanimanje.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.zanimanjeform',
    id: 'zanimanjeform',
    
    title: 'Novo zanimanje',
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
                    submit: Zanimanje.save
                },
    
                items: [
                    {
                        xtype: 'textareafield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
			grow: true,
			anchor: '100%',
			maxLength: 100
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
                        scope: me,
                        handler: function() {
                            me.down('form').getForm().submit({
				success: function(form, action) {    
				    Ext.widget('notification').popup('Zanimanje uspješno dodano.');
				    // Create a new record from form data
				    var r = Ext.ModelManager.create(form.getValues(), 'Athene.model.Zanimanje');
				    // Add new record to store
				    Ext.getStore('Zanimanje').add(r);
				    // Resort
				    Ext.getStore('Zanimanje').sort();
				},
	                        failure: function(form, action) {
				    Ext.widget('notification').popup({
					message: action.result.message,
					icon: 'img/icons/exclamation.png'
				    });
	                        }
			    })
                        }
                    }
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});