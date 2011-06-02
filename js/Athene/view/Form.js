Ext.define('Athene.view.Form', {
    extend: 'Ext.window.Window',
    
    layout: 'fit',
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
                  
                items: [
                    {
                        name: 'label',
                        fieldLabel: 'Label',
                        allowBlank: false,
			maxLength: 100
                    },
                    {
                        name: 'ext_id',
                        fieldLabel: 'ext ID',
                        allowBlank: false
                    },
                    {
                        name: 'ext_cls',
                        fieldLabel: 'ext cls'
                    },
                    {
                        xtype: 'checkbox',
                        name: 'ext_leaf',
                        fieldLabel: 'ext leaf',
                        inputValue: '1',
                        uncheckedValue: '0'
                    },
                    {
                        xtype: 'checkbox',
                        name: 'ext_expanded',
                        fieldLabel: 'ext expanded',
                        inputValue: '1',
                        uncheckedValue: '0'
                    },
                    {
                        xtype: 'combobox',
                        name: 'parent',
                        fieldLabel: 'Parent',
                        store: new Athene.store.Menu({autoLoad: true}),
                        displayField: 'label',
                        valueField: 'id'
                    }
                ],
                buttons: [
		    {
			text: 'Odustani',
			handler: function() {
                           this.up('window').close();
			}
		    },
                    {
                        text: 'Dodaj',
			itemId: 'formSubmit',
                        handler: function() {
			    var form = this.up('form').getForm(); // shorthand
                            if(form.getRecord()) {
                                form.getRecord().update();
                            } else {
                                var r = Ext.ModelManager.create(form.getFieldValues(), 'Menu');
                                r.save();
                            }
                        }
                    }
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});