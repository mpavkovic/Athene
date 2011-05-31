Ext.define('Athene.view.ucitelj.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.uciteljlist',
    id: 'uciteljlist',
    
    title: 'Popis učitelja',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
	
	tools: [
        {
            type: 'help',
            id: 'helpUcitelj',
            qtip: 'Pomoć'
        }
    ],
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'uciteljgrid',
                store: 'Ucitelj',
                forceFit: true,
                columns: [
                    {
                        text: 'ID',
                        dataIndex: 'id'
                    },
                    {
                        text: 'Prezime',
                        dataIndex: 'prezime'
                    },
		    {
                        text: 'Ime',
                        dataIndex: 'ime'
                    },
		    {
                        text: 'Titual (prefix)',
                        dataIndex: 'titula_prefix'
                    },
		    {
                        text: 'Titula (sufix)',
                        dataIndex: 'titula_sufix'
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
                        text: 'Dodaj učitelja', 
                        id: 'openUciteljForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('uciteljlist', Athene.view.ucitelj.List);