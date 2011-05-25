Ext.define('Athene.view.dodijeljenapoteskoca.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.dodijeljenapoteskocalist',
    id: 'dodijeljenapoteskocalist',
    
    title: 'Popis dodijeljenih poteškoća',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'dodijeljenapoteskocagrid',
                store: 'DodijeljenaPoteskoca',
                forceFit: true,
                columns: [
                    {
                        text: 'Učenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Vrsta poteškoće',
                        dataIndex: 'vrsta_poteskoce_id'
                    },
                    {
                        text: 'Datum od',
                        dataIndex: 'datum_od'
                    },
                    {
                        text: 'Datum do',
                        dataIndex: 'datum_do'
                    },
                    {
                        text: 'Klasa',
                        dataIndex: 'klasa'
                    },
                    {
                        text: 'Uruđbeni broj',
                        dataIndex: 'urudzbeni_broj'
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
                        text: 'Dodaj dodijeljenapoteskoca', 
                        id: 'openDodijeljenaPoteskocaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});