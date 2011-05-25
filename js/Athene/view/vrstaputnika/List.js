Ext.define('Athene.view.vrstaputnika.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.vrstaputnikalist',
    id: 'vrstaputnikalist',
    
    title: 'Popis vrsta putnika',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'vrstaputnikagrid',
                store: 'VrstaPutnika',
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
                        text: 'Dodaj vrstu putnika', 
                        id: 'openVrstaPutnikaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});