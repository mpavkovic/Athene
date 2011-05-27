Ext.define('Athene.view.narodnost.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.narodnostlist',
    id: 'narodnostlist',
    
    title: 'Popis narodnosti',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'narodnostgrid',
                store: 'Narodnost',
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
                        icon: 'img/icons/add.png',
                        text: 'Dodaj narodnost',
                        id: 'openNarodnostForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('narodnostlist', Athene.view.narodnost.List);