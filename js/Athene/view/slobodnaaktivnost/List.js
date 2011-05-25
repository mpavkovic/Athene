Ext.define('Athene.view.slobodnaaktivnost.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.slobodnaaktivnostlist',
    id: 'slobodnaaktivnostlist',
    
    title: 'Popis slobodnih aktivnosti',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'slobodnaaktivnostgrid',
                store: 'SlobodnaAktivnost',
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
                        text: 'Dodaj slobodnu aktivnost', 
                        id: 'openSlobodnaAktivnostForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});