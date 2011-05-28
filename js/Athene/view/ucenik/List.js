Ext.define('Athene.view.ucenik.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.uceniklist',
    id: 'uceniklist',
    
    title: 'Popis Učenika',
    layout: 'fit',
    width: 950,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'ucenikgrid',
                store: 'Ucenik',
                forceFit: true,
                columns: [
                    {
                        text: 'OIB',
                        dataIndex: 'oib'
                    },
                    {
                        text: 'JMBG',
                        dataIndex: 'jmbg'
                    },
                    {
                        text: 'Ime',
                        dataIndex: 'ime'
                    },
                    {
                        text: 'Prezime',
                        dataIndex: 'prezime'
                    },
                    {
                        text: 'Datum rođenja',
                        dataIndex: 'datum_rodjenja'
                    },
                    {
                        text: 'Mjesto rođenja',
                        dataIndex: 'mjesto_rodjenja_id'
                    },
                    {
                        text: 'Spol',
                        dataIndex: 'spol'
                    },
                    {
                        text: 'Sportaš',
                        dataIndex: 'sportas'
                    },
                    {
                        text: 'Vrsta putnika',
                        dataIndex: 'vrsta_putnika_id'
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
                        text: 'Dodaj učenika', 
                        id: 'openUcenikForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('uceniklist', Athene.view.ucenik.List);