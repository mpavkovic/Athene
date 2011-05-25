Ext.define('Athene.view.nacionalnamanjina.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.nacionalnamanjinalist',
    id: 'nacionalnamanjinalist',
    
    title: 'Popis nacionalnih manjina',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'nacionalnamanjinagrid',
                store: 'NacionalnaManjina',
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
                        text: 'Dodaj nacionalnu manjinu', 
                        id: 'openNacionalnaManjinaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});