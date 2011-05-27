Ext.define('Athene.view.nastavniplan.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavniplanlist',
    id: 'nastavniplanlist',
    
    title: 'Popis nastavnih planova',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'nastavniplangrid',
                store: 'NastavniPlan',
                forceFit: true,
                columns: [
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
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
                        text: 'Dodaj nastavni plan', 
                        id: 'openNastavniPlanForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('nastavniplanlist', Athene.view.nastavniplan.List);