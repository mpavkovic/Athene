Ext.define('Athene.view.nastavnajedinica.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavnajedinicalist',
    id: 'nastavnajedinicalist',
    
    title: 'Popis Nastavnih jedinica',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'nastavnajedinicagrid',
                store: 'NastavnaJedinica',
                forceFit: true,
                columns: [
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        text: 'Nastavni plan',
                        dataIndex: 'nastavni_plan_id'
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
                        text: 'Dodaj nastavnu jedinicu', 
                        id: 'openNastavnaJedinicaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});