Ext.define('Athene.view.menu.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.menuform',
    id: 'menuform',
    
    title: 'Novi izbornik',
    layout: 'fit',
    constrain: true,
    
    listeners: {
        show: function(el) {
            console.log(el.down('field').focus());
        }
    },
       
    initComponent: function() {
        
        this.items = [
            {
                xtype: 'form',
                bodyPadding: '6 10',
                layout: 'anchor',
                border: 0,
                defaults: {
                    anchor: '100%',
                    padding: '2 0'
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
                        store: 'MenuCombo',
                        displayField: 'label',
                        valueField: 'id',
                        forceSelection: true,
                        typeAhead: true
                    }
                ]
            }
        ];
        
        this.buttons = [
	    {
		text: 'Odustani',
                scope: this,
		handler: this.close
            },
            {
                text: 'Dodaj',
		action: 'save'
            }
        ];
        
        this.callParent(arguments);
    }
});