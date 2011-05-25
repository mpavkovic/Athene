Ext.define('Athene.view.razlogboravista.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.razlogboravistalist',
    id: 'razlogboravistalist',
    
    title: 'Popis razloga boravišta',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'razlogboravistagrid',
                store: 'RazlogBoravista',
                forceFit: true,
                columns: [
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
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
                        text: 'Dodaj razlog boravišta', 
                        id: 'openRazlogBoravistaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});