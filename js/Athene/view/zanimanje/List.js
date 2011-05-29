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
                id: 'zanimanjegrid',
                store: 'Zanimanje',
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
                        icon: 'img/icons/add.png',
                        text: 'Dodaj zanimanje', 
                        id: 'openZanimanjeForm'
                    },
                    {
                        xtype: 'button',
                        icon: 'img/icons/refresh.png',
                        text: 'Osvježi',
                        id: 'refreshZanimanjeList'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('zanimanjelist', Athene.view.zanimanje.List);