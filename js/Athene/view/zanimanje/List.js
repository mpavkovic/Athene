Ext.define('Athene.view.zanimanje.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.zanimanjelist',
    id: 'zanimanjelist',
    
    title: 'Popis zanimanja',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'zanimanjagrid',
                store: 'Zanimanja',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
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
                        icon: 'icons/add.png',
                        text: 'Dodaj zanimanje', 
                        id: 'openZanimanjaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});