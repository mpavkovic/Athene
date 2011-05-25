Ext.define('Athene.view.metodskajedinica.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.metodskajedinicalist',
    id: 'metodskajedinicalist',
    
    title: 'Popis Metodskih jedinica',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'metodskajedinicagrid',
                store: 'MetodskaJedinica',
                forceFit: true,
                columns: [
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        text: 'Nastavna jedinica',
                        dataIndex: 'nastavna_jedinica_id'
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
                        text: 'Dodaj metodsku jedinicu', 
                        id: 'openMetodskaJedinicaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});