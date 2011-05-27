Ext.define('Athene.view.predmetrazrednogodjeljenja.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetrazrednogodjeljenjalist',
    id: 'predmetrazrednogodjeljenjalist',
    
    title: 'Popis Predmeta razrednog odjeljenja',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'predmetrazrednogodjeljenjagrid',
                store: 'PredmetRazrednogOdjeljenja',
                forceFit: true,
                columns: [
                    {
                        text: 'Razredno odjeljenje',
                        dataIndex: 'razredno_odjeljenje_id'
                    },
                    {
                        text: 'Predmet',
                        dataIndex: 'predmet_id'
                    },
                    {
                        text: 'Učitelj',
                        dataIndex: 'ucitelj_id'
                    },
                    {
                        text: 'Polugodište',
                        dataIndex: 'polugodiste'
                    },
                    {
                        text: 'Realiziran broj sati',
                        dataIndex: 'realiziran_broj_sati'
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
                        text: 'Dodaj predmet razrednog odjeljenja', 
                        id: 'openPredmetRazrednogOdjeljenjaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('predmetrazrednogodjeljenjalist', Athene.view.predmetrazrednogodjeljenja.List);