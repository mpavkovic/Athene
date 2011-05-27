Ext.define('Athene.view.predmet.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetlist',
    id: 'predmetlist',
    
    title: 'Popis Predmeta',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'predmetgrid',
                store: 'Predmet',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
                    },
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        text: 'Razred',
                        dataIndex: 'razred'
                    },
                    {
                        text: 'Predviđen broj sati',
                        dataIndex: 'previdjen_broj_sati'
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
                        text: 'Dodaj predmet', 
                        id: 'openPredmetForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('predmetlist', Athene.view.predmet.List);