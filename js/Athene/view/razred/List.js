Ext.define('Athene.view.razred.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.razredlist',
    id: 'razredlist',
    
    title: 'Popis razreda',
    layout: 'fit',
    width: 800,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'razredgrid',
                store: 'Razred',
                forceFit: true,
                columns: [
                    {
                        dataIndex: 'id',
                        text: 'ID'
                    },
                    {
                        dataIndex: 'naziv',
                        text: 'Naziv',
                        flex: 1
                    },
                    {
                        dataIndex: 'skolska_godina_id',
                        text: 'Šk. godina'
                    },
                    {
                        dataIndex: 'razrednik_id',
                        text: 'Razrednik'
                    },
                    {
                        dataIndex: 'klasa',
                        text: 'Klasa'
                    },
                    {
                        dataIndex: 'urudzbeni_broj',
                        text: 'Uruđbeni broj'
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
                        text: 'Dodaj razred', 
                        id: 'openRazredForm'
                    },
                    '->',
                    {
                        xtype: 'combo',
                        id: 'filterRazredBySkGod',
                        store: 'SkolskaGodina',
                        fieldLabel: 'Školska godina',
                        displayField: 'godina',
                        valueField: 'godina'
                    },
                    '->',
                    {
                        xtype: 'combo',
                        id: 'filterRazredByRazrednik',
                        store: 'Ucitelj',
                        fieldLabel: 'Razrednik',
                        displayField: 'prezime',
                        valueField: 'id'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('razredlist', Athene.view.razred.List);