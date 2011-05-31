Ext.define('Athene.view.drzava.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.drzavalist',
    id: 'drzavalist',
    
    title: 'Popis država',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'drzavagrid',
                store: 'Drzava',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
                    },
                    {
                        text: 'Državljanstvo',
                        dataIndex: 'drzavljanstvo'
                    }
                ]
            }
        ];
        
        this.dockedItems = [
            {
                xtype: 'toolbar',
                dock: 'top',
                items: [
                    {
                        xtype: 'button',
                        icon: 'img/icons/add.png',
                        text: 'Dodaj državu', 
                        id: 'openDrzavaForm'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Drzava',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('drzavalist', Athene.view.drzava.List);