Ext.define('Athene.view.poteskoca.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.poteskocalist',
    id: 'poteskocalist',
    
    title: 'Popis poteškoća',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'poteskocagrid',
                store: 'Poteskoca',
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
                        text: 'Dodaj poteškoću', 
                        id: 'openPoteskocaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});