Ext.define('Athene.view.ocjena.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.ocjenalist',
    id: 'ocjenalist',
    
    title: 'Popis Ocjena',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'ocjenagrid',
                store: 'Ocjena',
                forceFit: true,
                columns: [
                    {
                        text: 'Ocjena',
                        dataIndex: 'ocjena'
                    },
                    {
                        text: 'Ucenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Predmetna cjelina',
                        dataIndex: 'predmetna_cjelina_id'
                    },
                    {
                        text: 'Kategorija ocjena',
                        dataIndex: 'kategorija_ocjena_id'
                    },
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Opaska',
                        dataIndex: 'opaska'
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
                        text: 'Dodaj ocjenu', 
                        id: 'openOcjenaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});