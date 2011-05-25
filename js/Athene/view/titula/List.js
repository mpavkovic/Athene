Ext.define('Athene.view.titula.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.titulalist',
    id: 'titulalist',
    
    title: 'Popis titula',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'titulagrid',
                store: 'Titula',
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
                        text: 'Dodaj titulu', 
                        id: 'openTitulaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});