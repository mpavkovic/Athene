Ext.define('Athene.view.nastavnisat.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavnisatlist',
    id: 'nastavnisatlist',
    
    title: 'Popis Nastavnih Satova',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'nastavnisatgrid',
                store: 'NastavniSat',
                forceFit: true,
                columns: [
                    {
                        text: 'Ucitelj',
                        dataIndex: 'ucitelj_id'
                    },
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        text: 'Metodska jedinica',
                        dataIndex: 'metodska_jedinica_id'
                    },
                    {
                        text: 'Predmet razrednog odjeljenja',
                        dataIndex: 'predmet_razrednog_odjeljenja_id'
                    },
                    {
                        text: 'Napomena',
                        dataIndex: 'napomena'
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
                        text: 'Dodaj nastavni sat', 
                        id: 'openNastavniSatForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('nastavnisatlist', Athene.view.nastavnisat.List);