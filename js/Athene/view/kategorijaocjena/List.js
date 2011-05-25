Ext.define('Athene.view.kategorijaocjena.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.kategorijaocjenalist',
    id: 'kategorijaocjenalist',
    
    title: 'Popis kategorija ocjena',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'kategorijaocjenagrid',
                store: 'KategorijaOcjena',
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
                        text: 'Dodaj kategoriju ocjena', 
                        id: 'openKategorijaOcjenaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});