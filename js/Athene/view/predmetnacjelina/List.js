Ext.define('Athene.view.predmetnacjelina.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetnacjelinalist',
    id: 'predmetnacjelinalist',
    
    title: 'Popis predmetnih cjelina',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'predmetnacjelinagrid',
                store: 'PredmetnaCjelina',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
                    },
                    {
                        text: 'Predmet',
                        dataIndex: 'predmet_id'
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
                        text: 'Dodaj predmetnacjelina', 
                        id: 'openPredmetnaCjelinaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});